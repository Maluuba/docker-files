from ubuntu

MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

RUN apt-get update
RUN apt-get install -y libmysqlclient-dev 
RUN apt-get install -y python-dev 
RUN apt-get install -y git 
RUN apt-get install -y libxml2-dev 
RUN apt-get install -y libxslt-dev 
RUN apt-get install -y python-pip
RUN pip install pip==1.4.1
RUN easy_install -U distribute
RUN apt-get clean
