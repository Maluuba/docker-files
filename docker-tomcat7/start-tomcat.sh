#!/bin/sh

if [ -d /deployment ];
then
	echo "Mapping deployed wars"
	rm -rf /var/lib/tomcat7/webapps
	ln -s /deployment /var/lib/tomcat7/webapps
fi

if [ -n "${Xmx}" ];
then
	sed -i s/Xmx.*\ /Xmx${Xmx}\ /g /etc/default/tomcat7
fi

if [ -n "${JAVA_OPTS}" ];
then
	# Add any Java opts that are set in the container
	echo "Adding JAVA OPTS"
	echo "JAVA_OPTS=\"\${JAVA_OPTS} ${JAVA_OPTS} \"" >> /etc/default/tomcat7
fi

service tomcat7 restart
#Run bash to keep container running and provide interactive mode
bash