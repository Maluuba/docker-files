FROM ubuntu:14.04
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

# Install Java
RUN apt-get -qq -y update
RUN apt-get -qq -y upgrade
RUN apt-get -qq -y install openjdk-7-jdk
RUN apt-get -qq -y install curl
RUN apt-get -qq -y install bash

ADD start-jetty.sh /opt/start-jetty.sh
RUN chmod +x /opt/start-jetty.sh

# Install Jetty
ADD jetty-distribution-8.1.21.v20160908.tar.gz /opt/jetty.tar.gz
RUN tar -xvf /opt/jetty.tar.gz -C /opt/
RUN rm /opt/jetty.tar.gz
RUN mv /opt/jetty-distribution-* /opt/jetty
RUN rm -rf /opt/jetty/webapps.demo
RUN useradd jetty -U -s /bin/false
RUN chown -R jetty:jetty /opt/jetty

# Setup UTF * based terminal
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8 

# Run Jetty
CMD ["/opt/start-jetty.sh"]
