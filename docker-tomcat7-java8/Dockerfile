FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

# Required for apt-add-repository
RUN apt-get -qq update
RUN apt-get -qq install software-properties-common python-software-properties

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
RUN apt-add-repository "deb http://repos.azulsystems.com/ubuntu stable main"
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get -qq update
RUN apt-get -qq upgrade

RUN apt-get -qq install g++-4.9 #libstdc++6-4.9
RUN apt-get -qq install zulu-8
RUN apt-get -qq install curl
RUN apt-get -qq install tomcat7
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
ENV JAVA_HOME /usr/lib/jvm/zulu-8-amd64/

ENTRYPOINT ["/opt/start-tomcat.sh"]
