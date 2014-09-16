#!/bin/sh

if [ -f /jenkins/init.sh ];
then
	echo "Running custom init script"
	chmod +x /jenkins/init.sh
	/jenkins/init.sh
fi

java -jar /opt/jenkins.war &
bash
