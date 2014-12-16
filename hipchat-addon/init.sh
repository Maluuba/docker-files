#!/bin/sh

service ntp restart

service monit restart
sleep 2
monit monitor all

export DEV_KEY="MALUUBA_HELLO_WORLD"
export LOCAL_BASE_URL=$(cat /var/log/ngrok.log  | grep "Tunnel established" | tail -1 | sed 's/.*Tunnel established at //g')
echo "\nTunnel established at ${LOCAL_BASE_URL}\n"

/etc/init.d/redis-server restart

if [ -d /src/addon/ ];
then
	echo "Copying custom code"
	cp -R /src/addon/* ./
fi

npm run web-dev