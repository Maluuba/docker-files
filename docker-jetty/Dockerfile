FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

# Install Java
RUN apt-get -qq update
RUN apt-get -qq upgrade
RUN apt-get -qq install openjdk-7-jdk
RUN apt-get -qq install curl
RUN apt-get -qq install bash

ADD start-jetty.sh /opt/start-jetty.sh
RUN chmod +x /opt/start-jetty.sh

# Install Jetty
ADD http://eclipse.org/downloads/download.php?file=/jetty/stable-8/dist/jetty-distribution-8.1.17.v20150415.tar.gz&r=1 /opt/jetty.tar.gz
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
