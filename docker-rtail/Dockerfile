FROM node:0.12.6
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

RUN apt-get -qq update
RUN apt-get -qq upgrade

RUN apt-get -qq -y install inotify-tools

RUN npm install -g rtail

ENV FILES_IREGEX='.*\\.log' WATCH_IREGEX='.*\\.log'

ADD rtail-logs.sh /opt/rtail-logs.sh
RUN chmod +x /opt/rtail-logs.sh

WORKDIR /logs

ENTRYPOINT ["/opt/rtail-logs.sh"]
