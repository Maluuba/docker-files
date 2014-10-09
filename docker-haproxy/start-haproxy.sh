#!/bin/sh

if [ -f /etc/haproxy/init.sh ];
then
	echo "Running custom init script"
	chmod +x /etc/haproxy/init.sh
	/etc/haproxy/init.sh
fi

#Override the exit command to prevent accidental container distruction 
alias exit="echo \"Are you sure? this will kill the container. use 'Ctrl + p, Ctrl + q' to detach or 'ctrl + d' to exit\""

service haproxy restart
bash
