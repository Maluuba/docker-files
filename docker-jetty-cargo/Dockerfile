FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

# Install Java
RUN apt-get -qq update
RUN apt-get -qq upgrade
RUN apt-get -qq install openjdk-7-jdk
RUN apt-get -qq install bash

ADD start-jetty.sh /opt/start-jetty.sh
RUN chmod +x /opt/start-jetty.sh

# Install Jetty
ADD http://eclipse.org/downloads/download.php?file=/jetty/stable-8/dist/jetty-distribution-8.1.16.v20140903.tar.gz&r=1 /opt/jetty.tar.gz
RUN tar -xvf /opt/jetty.tar.gz -C /opt/
RUN rm /opt/jetty.tar.gz
RUN mv /opt/jetty-distribution-* /opt/jetty
RUN rm -rf /opt/jetty/webapps.demo
RUN useradd jetty -U -s /bin/false
RUN chown -R jetty:jetty /opt/jetty

# Install Cargo
ADD http://repo1.maven.org/maven2/org/codehaus/cargo/cargo-jetty-7-and-onwards-deployer/1.4.9/cargo-jetty-7-and-onwards-deployer-1.4.9.war /opt/jetty/webapps/cargo-jetty-7-and-onwards-deployer-1.4.9.war


# Run Jetty
CMD ["/opt/start-jetty.sh"]