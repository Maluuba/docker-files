#!/bin/sh

if [ -f /data/init.sh ];
then
	echo "Running custom init script"
	chmod +x /data/init.sh
	/data/init.sh
fi

supervisord -c /etc/supervisor/supervisord.conf
