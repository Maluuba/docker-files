FROM node:5
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

# Get packages
RUN apt-get update && apt-get install -y zip locales

# Setup UTF-8 based terminal
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ADD https://s3.amazonaws.com/aws-cli/awscli-bundle.zip /tmp/
RUN unzip /tmp/awscli-bundle.zip -d /tmp \
	&& /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && rm /tmp/awscli-bundle.zip

ENV AWS_REGION us-east-1
ENV AWS_KEY your_aws_key
ENV AWS_SECRET your_aws_secret
ENV S3_PATH your_s3_bucket/filename 
ENV LOCAL_NAME app.tar.gz
COPY preactivate.sh /opt/preactivate.sh

RUN chmod +x /opt/preactivate.sh && npm install -g forever

# Allows local users to attach their aws credential config 
VOLUME ~/.aws
EXPOSE 5000

# Start node
CMD ["/opt/preactivate.sh"]
