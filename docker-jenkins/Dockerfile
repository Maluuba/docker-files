FROM ubuntu:14.04
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

RUN apt-get update && apt-get clean
RUN apt-get install -qqy openjdk-7-jre-headless
RUN apt-get install -qqy git docker.io

VOLUME /var/lib/docker

# Install Jenkins
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
ADD start-jenkins.sh /opt/start-jenkins.sh
RUN chmod +x /opt/start-jenkins.sh
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins
ENV LANG C.UTF-8

EXPOSE 8080

CMD ["/opt/start-jenkins.sh"]

