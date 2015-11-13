FROM node:0.10.40
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

RUN npm install forever
RUN apt-get update && apt-get -y install unzip

ADD https://s3.amazonaws.com/aws-cli/awscli-bundle.zip /tmp/
ADD start-node.sh /opt/start-node.sh
RUN unzip /tmp/awscli-bundle.zip -d /tmp \
	&& /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# Start node
ENTRYPOINT /opt/start-node.sh
