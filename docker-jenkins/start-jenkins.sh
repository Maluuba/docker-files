#!/bin/sh

JENKINS_INIT_PATH=/jenkins/init.sh

if [ -n "$DIND" ]; 
then
	echo "Running docker in docker as DIND variable was set. This will fail if your did not run in privileged mode"
	service docker.io restart
	echo 'alias docker=docker.io' > ~/.bashrc
fi

if [ -f $JENKINS_INIT_PATH ];
then
	echo "Running custom init script: $JENKINS_INIT_PATH"
	chmod +x $JENKINS_INIT_PATH
	$JENKINS_INIT_PATH
else
        echo "No init script found at $JENKINS_INIT_PATH, you can see an example of the recommended script at https://github.com/Maluuba/deployment/blob/master$JENKINS_INIT_PATH"
fi

java -jar /opt/jenkins.war
