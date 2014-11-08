FROM ubuntu:14.04
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
RUN apt-get install -q -y git
RUN apt-get -qq install bash

ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
ADD start-jenkins.sh /opt/start-jenkins.sh
RUN chmod +x /opt/start-jenkins.sh
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins



EXPOSE 8080

CMD ["/opt/start-jenkins.sh"]

