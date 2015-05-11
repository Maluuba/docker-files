FROM ubuntu:14.04
MAINTAINER Usman Ismail <usman.ismail@maluuba.com>
EXPOSE 8082

RUN apt-get -qq update
RUN apt-get -y upgrade
RUN apt-get -qq install nodejs npm mongodb git
RUN apt-get -qq install bash

RUN mkdir /opt/uptime
RUN rm -fr /opt/uptime && git clone --depth=1 --branch digest-support https://github.com/Maluuba/uptime.git  /opt/uptime



WORKDIR /opt/uptime
RUN npm install

ADD config_template.yaml /opt/uptime/config/config_template.yaml
RUN rm /opt/uptime/config/default.yaml

ADD run-uptime.sh /opt/run-uptime.sh
RUN chmod +x /opt/run-uptime.sh



ENTRYPOINT ["/opt/run-uptime.sh"]
CMD ["rootpass"]
