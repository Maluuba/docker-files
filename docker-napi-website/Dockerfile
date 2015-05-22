FROM ubuntu
MAINTAINER Maluuba NLP Team <nlp@maluuba.com>

# TODO install missing thing for some gem
#RUN apt-get install -qqy 

RUN apt-get -qq update
RUN apt-get -qq upgrade

RUN apt-get -qq install curl
RUN apt-get -qq install bash

# Setup UTF * based terminal
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN mkdir -p /tmp/docker_dir
WORKDIR /tmp/docker_dir

# Ruby, JRuby, and RVM
# Default to production, as per the README, this can be overriden in `docker run` by adding "-e RAILS_ENV=development"
ENV RAILS_ENV production 
ADD Gemfile /tmp/docker_dir/Gemfile
ADD Gemfile.lock /tmp/docker_dir/Gemfile.lock
ADD install_rvm.sh /tmp/docker_dir/install_rvm.sh
RUN chmod +x /tmp/docker_dir/install_rvm.sh
RUN /tmp/docker_dir/install_rvm.sh


EXPOSE 8080

ADD start-napi-website.sh /opt/start-napi-website.sh
RUN chmod +x /opt/start-napi-website.sh

ENTRYPOINT ["bash", "-c", "/opt/start-napi-website.sh"]
