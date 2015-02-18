#!/bin/sh

NLP_TOOLSET_DIR=/NlpToolset
INIT_SCRIPT_PATH=$NLP_TOOLSET_DIR/init.sh

if [ -f $INIT_SCRIPT_PATH ];
then
	echo "Running custom init script: $INIT_SCRIPT_PATH"
	chmod +x $INIT_SCRIPT_PATH
	$INIT_SCRIPT_PATH
else
	echo "No init script found at $INIT_SCRIPT_PATH, you can see an example of the recommended script at https://github.com/Maluuba/NlpToolset/blob/master/init.sh"
fi

cd $NLP_TOOLSET_DIR

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
