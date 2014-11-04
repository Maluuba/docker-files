FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

RUN apt-get -qq update
RUN apt-get -qq upgrade

RUN apt-get -y install nodejs git

RUN git clone git@github.com:Maluuba/SeleniumWebviewTest.git
RUN cd SeleniumWebviewTest

RUN npm install
ENTRYPOINT ["node", "app.js"]
