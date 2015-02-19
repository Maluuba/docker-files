FROM maluuba/tomcat7
MAINTAINER Maluuba NLP Team <nlp@maluuba.com>

# Git
RUN apt-get install -qqy git

# Maven
RUN apt-get remove maven2
ENV MAVEN_VERSION 3.2.5
RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven

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

# Get user folders set up.
RUN mkdir -p /usr/share/tomcat7/nlptoolset/nlprepos
RUN mkdir -p /usr/share/tomcat7/nlptoolset/db
RUN chown -R tomcat7:tomcat7 /usr/share/tomcat7/nlptoolset

EXPOSE 8080

ADD start-nlp-toolset.sh /opt/start-nlp-toolset.sh
RUN chmod +x /opt/start-nlp-toolset.sh

CMD ["bash", "-c", "/opt/start-nlp-toolset.sh"]
