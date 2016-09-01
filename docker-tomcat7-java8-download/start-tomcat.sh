#!/bin/sh

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
if [ -n "${JAVA_HOME}" ];
then
        # Add java home if set in container
        echo "Adding JAVA_HOME"
        echo "JAVA_HOME=\"${JAVA_HOME}\"" >> /etc/default/tomcat7
fi


chown tomcat7:tomcat7 /deployment
service tomcat7 restart

tail -f /var/log/tomcat7/catalina.out
