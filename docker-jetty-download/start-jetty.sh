#!/bin/sh


echo "Setting up AWS Client"

mkdir -p ~/.aws
cat <<EOF > ~/.aws/credentials
[default]
aws_access_key_id = ${AWS_KEY}
aws_secret_access_key = ${AWS_SECRET}
EOF

cat <<EOF > ~/.aws/config
[default]
output = json
region = us-east-1
EOF

echo "Downloading jetty war"
rm -rf /opt/jetty/webapps/*
aws s3 cp s3://${S3_PATH} /opt/jetty/webapps/${LOCAL_PATH}.war

echo "Downloading custom config"
rm -rf /opt/jetty/contexts/*
aws s3 cp s3://${S3_LOGGING_PATH} /opt/jetty/etc/logging.xml
aws s3 cp s3://${S3_CONTEXT_PATH} /opt/jetty/contexts/${LOCAL_PATH}.xml

echo "${USER}: MD5:${PASSWORD_HASH},moderator" > opt/jetty/etc/${REALM_NAME}-realm.properties 

/opt/jetty/bin/jetty.sh run
