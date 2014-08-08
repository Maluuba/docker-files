FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

RUN apt-get -qq update
RUN apt-get -qq upgrade

RUN apt-get -y install s3cmd 

ADD backup.sh /opt/backup.sh
ADD s3cfg /.s3cfg

RUN chmod +x /opt/backup.sh

# Run Backup script
CMD ["/opt/backup.sh"]