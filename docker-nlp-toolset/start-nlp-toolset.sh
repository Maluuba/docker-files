#!/bin/sh

set -e
set -x

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

cp script/nlptoolset.conf /etc/init/nlptoolset.conf

bash -l -c "bundle install"

bash -l -c "rvm use jruby-1.7.10@nlp-toolset"
bash -l -c "rake db:migrate"
chown -R tomcat7:tomcat7 /usr/share/tomcat7/nlptoolset/db

if [[ $RAILS_ENV == 'production' ]]; then
	bash -l -c "mvn package -Dnlp.toolset.rails.env=$RAILS_ENV"
	service tomcat7 stop
	rm -rf /var/lib/tomcat7/webapps/ROOT*
	cp $NLP_TOOLSET_DIR/target/NlpToolset.war /var/lib/tomcat7/webapps/ROOT.war
	service tomcat7 restart

	start nlptoolset
else
	bash -l -c "rails server --port=8080&"
	bash -l -c "rake jobs:work&"
fi

curl localhost:8080

bash
