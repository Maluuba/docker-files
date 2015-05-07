FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

RUN apt-get -qq update
RUN apt-get -qq upgrade

RUN apt-get -qq install openjdk-7-jre tomcat7 curl bash unzip gzip ftp cron wget

RUN mv /etc/cron.daily/logrotate /etc/cron.hourly/logrotate

ADD logrotate /etc/logrotate.d/tomcat7
RUN chmod 644 /etc/logrotate.d/tomcat7

# Setup UTF * based terminal
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

ADD https://s3.amazonaws.com/aws-cli/awscli-bundle.zip /tmp/
RUN unzip /tmp/awscli-bundle.zip -d /tmp \
	&& /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

ADD start-movie-updater.sh /opt/start-movie-updater.sh
RUN chmod +x /opt/start-movie-updater.sh

# Set the time zone to the timezone used by our movie provider since they name their files based on their local date.
RUN echo "America/New_York" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

VOLUME /deployment

CMD ["/opt/start-movie-updater.sh"]
