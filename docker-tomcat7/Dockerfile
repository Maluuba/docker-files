FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

RUN apt-get -qq update
RUN apt-get -qq upgrade

RUN apt-get -qq install openjdk-7-jre
RUN apt-get -qq install tomcat7
RUN apt-get -qq install curl
RUN apt-get -qq install bash

ADD start-tomcat.sh /opt/start-tomcat.sh
RUN chmod +x /opt/start-tomcat.sh

RUN mv /etc/cron.daily/logrotate /etc/cron.hourly/logrotate

ADD logrotate /etc/logrotate.d/tomcat7
RUN chmod 644 /etc/logrotate.d/tomcat7

ENTRYPOINT ["/opt/start-tomcat.sh"]
