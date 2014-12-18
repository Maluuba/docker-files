FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

# Base Packages
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential libssl-dev monit unzip vim curl ntp redis-server mongodb git python

# Install Node, NPM and Nodemon
ENV NODE_VERSION 0.11.14
RUN git clone https://github.com/joyent/node.git /usr/src/node/

RUN cd /usr/src/node && git checkout v$NODE_VERSION && ./configure && make && make install
RUN apt-get install -y npm
RUN npm install -g nodemon
RUN npm install -g request
RUN rm -rf /usr/src/node

# Install ngrok
ADD https://dl.ngrok.com/linux_386/ngrok.zip /tmp/
RUN unzip /tmp/ngrok.zip -d /usr/local/bin/
ADD ngrok  /etc/monit/conf.d/ngrok
RUN ln -s /sbin/killall5 /usr/bin/killall

# Copy Hipchat Addon files
ADD package.json  /etc/hipchat/addon/
ADD README.md  /etc/hipchat/addon/
ADD web.js  /etc/hipchat/addon/

WORKDIR /etc/hipchat/addon/

# Setup project
RUN npm install

ADD init.sh /tmp/init.sh
RUN chmod 700 /tmp/init.sh

CMD ["/tmp/init.sh"]
