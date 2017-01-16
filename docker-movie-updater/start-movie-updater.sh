#!/bin/sh
#This is also movie-updater-iam

if [ -f /deployment/init.sh ];
then
	echo "Running custom init script"
	chmod +x /deployment/init.sh
	/deployment/init.sh
fi

echo "Setting up AWS Client"

cat <<EOF > ~/.aws/config
[default]
output = json
region = us-east-1
EOF

echo "Mapping deployed wars"
rm -rf /var/lib/tomcat7/webapps
rm -rf /deployment/*
ln -s /deployment /var/lib/tomcat7/webapps

aws s3 cp s3://${S3_PATH} /deployment/${LOCAL_PATH}
aws s3 cp s3://maluuba-content/movie-update-scripts/updateMovies.sh /opt/updater/updateMovies.sh
aws s3 cp s3://maluuba-content/movie-update-scripts/updateRatings.sh /opt/updater/updateRatings.sh
chmod -R 777 /opt/updater
(crontab -l 2>/dev/null; echo "*/45 * * * * /opt/updater/updateMovies.sh"; echo "0 9 * * * /opt/updater/updateRatings.sh"; echo "")| crontab -

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

chown tomcat7:tomcat7 /deployment
service tomcat7 restart
cron
bash
