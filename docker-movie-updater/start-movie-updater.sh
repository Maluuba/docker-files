#!/bin/sh


if [ -f /deployment/init.sh ];
then
	echo "Running custom init script"
	chmod +x /deployment/init.sh
	/deployment/init.sh
fi

echo "Setting up AWS Client"

mkdir -p ~/.aws
cat <<EOF > ~/.aws/credentials
[default]
aws_access_key_id = ${AWS_KEY}
aws_secret_access_key = ${AWS_SECRET}
EOF

export AWS_ACCESS_KEY_ID=${AWS_KEY}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET}

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
aws s3 cp s3://maluuba-content/movie-update-scripts/updateMovies.sh ~/updater
aws s3 cp s3://maluuba-content/movie-update-scripts/updateRatings.sh ~/updater

chmod +x ~/updater/updateMovies.sh
chmod +x ~/updater/updateRatings.sh
(crontab -l 2>/dev/null; echo "*/15 * * * ~/updater/updateMovies"; echo "0 9 * * * ~/updater/updateRatings.sh")| crontab -

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
bash