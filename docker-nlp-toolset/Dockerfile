FROM ubuntu:14.04
MAINTAINER Maluuba NLP Team <nlp@maluuba.com>

RUN apt-get update && apt-get clean
RUN apt-get install -qqy openjdk-7-jre-headless
RUN apt-get install -qqy git docker.io

VOLUME /var/lib/docker

ADD start-nlp-toolset.sh /opt/start-nlp-toolset.sh
RUN chmod +x /opt/start-nlp-toolset.sh

EXPOSE 81

CMD ["/opt/start-nlp-toolset.sh"]
