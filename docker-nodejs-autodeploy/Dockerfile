FROM node:0.10.40
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

RUN npm install forever
ADD start-node.sh

# Start node
ENTRYPOINT start-node.sh


