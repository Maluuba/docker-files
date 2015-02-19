#!/bin/bash

set -e

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

source /etc/profile.d/rvm.sh

cd $NLP_TOOLSET_DIR

cp script/nlptoolset.conf /etc/init/nlptoolset.conf

rvm use jruby-1.7.10@nlp-toolset

bundle install

rake db:migrate

chown -R tomcat7:tomcat7 /usr/share/tomcat7/nlptoolset/db

TOMCAT7_HOME=/usr/share/tomcat7

if [ "${RAILS_ENV}" == 'production' ]; then
	mvn package -Dnlp.toolset.rails.env=$RAILS_ENV
	service tomcat7 stop
	rm -rf /var/lib/tomcat7/webapps/ROOT*
	cp $NLP_TOOLSET_DIR/target/NlpToolset.war /var/lib/tomcat7/webapps/ROOT.war
	service tomcat7 restart

	start nlptoolset
else
	# In development mode, we run as root so we need the SSH keys in root's home.
	cp -R $TOMCAT7_HOME/.ssh/ /root/
	chmod 600 /root/.ssh/id_rsa

	rails server --port=8080&
	sleep 20
	rake jobs:work&
fi

sleep 20
curl localhost:8080 || echo "Not up yet"
