FROM node:0.12.6
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 8888

RUN npm install -g rtail

ENTRYPOINT ["rtail-server"]
CMD ["--wh", "0.0.0.0", "--uh", "0.0.0.0"]
