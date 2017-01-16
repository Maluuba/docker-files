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

# Setup UTF * based terminal
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

ENTRYPOINT ["/opt/start-tomcat.sh"]
