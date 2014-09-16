FROM ubuntu:14.04
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
RUN apt-get install -q -y git

ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
ADD start-jenkins.sh /opt/start-jenkins.sh
RUN chmod +x /opt/start-jenkins.sh
RUN chmod 644 /opt/jenkins.war

# Pip for installing ServiceTemplates
RUN apt-get install libmysqlclient-dev virtualenvwrapper python-dev git libxml2-dev libxslt-dev
RUN pip install pip==1.4.1
RUN easy_install -U distribute

ENV JENKINS_HOME /jenkins



EXPOSE 8080

CMD ["/opt/start-jenkins.sh"]

