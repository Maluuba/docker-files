#!/bin/sh

JENKINS_INIT_PATH=/jenkins/init.sh

if [ -f $JENKINS_INIT_PATH ];
then
	echo "Running custom init script: $JENKINS_INIT_PATH"
	chmod +x $JENKINS_INIT_PATH
	$JENKINS_INIT_PATH
else
        echo "No init script found at $JENKINS_INIT_PATH, you can see an example of the recommended script at https://github.com/Maluuba/deployment/blob/master$JENKINS_INIT_PATH"
fi

java -jar /opt/jenkins.war &

#Override the exit command to prevent accidental container distruction 
echo 'alias exit="echo Are you sure? this will kill the container. use Ctrl + p, Ctrl + q to detach or ctrl + d to exit"' > ~/.bashrc
bash
