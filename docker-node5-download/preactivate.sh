#!/bin/sh

echo "Setting up AWS Client"

mkdir -p ~/.aws
if [ ! -f ~/.aws/credentials ]; then
cat <<EOF > ~/.aws/credentials
[default]
aws_access_key_id = ${AWS_KEY}
aws_secret_access_key = ${AWS_SECRET}
EOF
fi

if [ ! -f ~/.aws/config ]; then
cat <<EOF > ~/.aws/config
[default]
output = json
region = ${AWS_REGION}  
EOF
fi

aws s3 cp s3://${S3_PATH} ${LOCAL_NAME} && tar -zxvf ${LOCAL_NAME} -C . 
npm install
forever -l app.log server.js
