############################################################
# Dockerfile to run an OrientDB (Graph) Container
# http://crosbymichael.com/dockerfile-best-practices.html
# http://crosbymichael.com/dockerfile-best-practices-take-2.html
############################################################

FROM debian:jessie

MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

# Update the default application repository sources list
RUN apt-get update

# Install supervisord
RUN apt-get -y install supervisor
RUN mkdir -p /var/log/supervisor

# Install OrientDB dependencies
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-orientdb-on-an-ubuntu-12-04-vps
RUN apt-get -y install openjdk-7-jdk git ant

ENV ORIENTDB_VERSION 2.0.8

# Build OrientDB cleaning up afterwards
RUN cd; git clone https://github.com/orientechnologies/orientdb.git --single-branch --depth 1 --branch $ORIENTDB_VERSION
RUN cd ~/orientdb; ant clean installg
RUN mv ~/releases/orientdb-community-* /opt/orientdb
RUN rm -rf /opt/orientdb/databases/* ~/orientdb

# use supervisord to start orientdb
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 2424
EXPOSE 2480

# Set the user to run OrientDB daemon
USER root

# Default command when starting the container
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
