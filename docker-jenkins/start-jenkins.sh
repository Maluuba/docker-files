#!/bin/sh
java -jar /opt/jenkins.war &

#Override the exit command to prevent accidental container distruction 
alias exit="echo \"Are you sure? this will kill the container. use 'Ctrl + p, Ctrl + q' to detach or 'ctrl + d' to exit"\"
bash
