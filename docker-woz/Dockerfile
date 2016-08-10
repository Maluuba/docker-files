FROM node:5
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

# For production
EXPOSE 1337
# For development
EXPOSE 8080

RUN apt-get update

# Default to production, this can be overriden in `docker run` by adding "-e NODE_ENV=development"
ENV NODE_ENV production 

ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

ENTRYPOINT ["bash", "-c", "/opt/start.sh"]
