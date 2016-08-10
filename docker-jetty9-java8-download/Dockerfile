FROM ubuntu:16.04
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8080

# Required for apt-add-repository
RUN apt-get -qq update
RUN apt-get -qq install software-properties-common python-software-properties

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get -qq update
RUN apt-get -qq upgrade

RUN apt-get -qq install curl bash unzip
RUN apt-get -qq install default-jdk 
RUN apt-get -qq install supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD start-jetty.sh /opt/start-jetty.sh
RUN chmod +x /opt/start-jetty.sh

# Install Jetty
ADD http://download.eclipse.org/jetty/9.3.8.v20160314/dist/jetty-distribution-9.3.8.v20160314.tar.gz /opt/jetty.tar.gz
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

RUN mkdir /etc/jetty &&  mkdir /etc/jetty/webapps && mkdir /etc/jetty/config 
ADD https://s3.amazonaws.com/aws-cli/awscli-bundle.zip /tmp/
RUN unzip /tmp/awscli-bundle.zip -d /tmp \
&& /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# Run Jetty
CMD ["/opt/start-jetty.sh"]
