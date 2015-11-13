#!/usr/bin/env bash
#This file needs to have LF line-endings to execute properly

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

echo "Extracting"

aws s3 cp s3://${S3_PATH} /var/nodejs/${LOCAL_PATH}
cd /var/nodejs
tar -xzf ${LOCAL_PATH}

echo "Starting NodeJS"

forever start /var/nodejs/app.js &
