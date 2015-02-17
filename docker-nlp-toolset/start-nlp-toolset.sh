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

curl nlptoolset.maluuba.com:81 > /dev/null

# Go to NlpToolset folder
NLP_TOOLSET_DIR=/NlpToolset
# TODO set password in $NLP_TOOLSET_DIR/config/environments/production.rb

mvn package
cp $NLP_TOOLSET_DIR/target/NlpToolset.war /var/lib/tomcat7/webapps/nlptoolset/ROOT.war
service tomcat7 restart

sudo start nlptoolset

rvm use jruby@nlp-toolset

rake jobs:work

rails s