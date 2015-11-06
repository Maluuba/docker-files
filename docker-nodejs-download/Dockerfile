FROM node:0.10.40
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

RUN npm install forever

# Setup UTF-8 based terminal
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ADD https://s3.amazonaws.com/aws-cli/awscli-bundle.zip /tmp/
RUN unzip /tmp/awscli-bundle.zip -d /tmp \
	&& /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# Start node
EXEC start-node.sh


