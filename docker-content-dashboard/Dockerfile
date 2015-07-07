FROM node:0.10

RUN npm install -g sails
EXPOSE 1337

ADD start-content-dashboard.sh /opt/start-content-dashboard.sh
RUN chmod +x /opt/start-content-dashboard.sh

ENTRYPOINT ["bash", "-c", "/opt/start-content-dashboard.sh"]
