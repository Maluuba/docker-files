FROM node:0.10.40
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

RUN npm install -g forever

# Start node
#ENTRYPOINT ls -R /
ENTRYPOINT forever start /var/nodejs/app.js


