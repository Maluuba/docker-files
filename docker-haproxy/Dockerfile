# Pull base image.

FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

# Install Haproxy.
RUN apt-get -y -qq update
RUN apt-get -y -qq upgrade
RUN apt-get -y -qq install bash software-properties-common
RUN add-apt-repository ppa:vbernat/haproxy-1.5 -y
RUN apt-get -y -qq update
RUN apt-get -y -qq install haproxy

# Enable HAProxy as a service
RUN sed -i s/ENABLED=0/ENABLED=1/g /etc/default/haproxy



# Define mountable directories.
VOLUME ["/etc/haproxy"]

# Define working directory.
WORKDIR /etc/haproxy

# Add Startup script
ADD start-haproxy.sh /opt/start-haproxy.sh
RUN chmod 700 /opt/start-haproxy.sh

# Define default command.
CMD ["/opt/start-haproxy.sh"]

# Expose ports.
EXPOSE 80
EXPOSE 443