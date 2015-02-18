#!/bin/sh

INIT_SCRIPT_PATH=/nlp-toolset/init.sh

if [ -f $INIT_SCRIPT_PATH ];
then
	echo "Running custom init script: $INIT_SCRIPT_PATH"
	chmod +x $INIT_SCRIPT_PATH
	$INIT_SCRIPT_PATH
else
        echo "No init script found at $INIT_SCRIPT_PATH, you can see an example of the recommended script at https://github.com/Maluuba/deployment/blob/master$INIT_SCRIPT_PATH"
fi

NLP_TOOLSET_DIR=/NlpToolset

cd $NLP_TOOLSET_DIR

# TODO set password in $NLP_TOOLSET_DIR/config/environments/production.rb


bundle install

# Production mode
RUN [RAILS_ENV=production] rake db:migrate

mvn package
cp $NLP_TOOLSET_DIR/target/NlpToolset.war /var/lib/tomcat7/webapps/nlptoolset/ROOT.war
service tomcat7 restart

start nlptoolset

rvm use jruby@nlp-toolset

rake jobs:work

rails s

curl localhost:3000 > /dev/null
