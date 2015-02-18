FROM maluuba/tomcat7
MAINTAINER Maluuba NLP Team <nlp@maluuba.com>


RUN apt-get install -qqy git docker.io

# Maven
RUN apt-get remove maven2
ENV MAVEN_VERSION 3.2.5
RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven

RUN mvn -version

# Ruby
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

RUN curl -sSL get.rvm.io | bash -s stable
RUN bash -l -c "rvm requirements"
RUN bash -l -c "rvm install jruby-1.7.10"
RUN echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
RUN bash -l -c "source /etc/profile.d/rvm.sh"
#RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc" #t
RUN bash -l -c "type rvm | head -n 1 | grep 'rvm is a function'"
RUN bash -l -c "rvm list known"
RUN bash -l -c "rvm list"
RUN bash -l -c "rvm use --create jruby-1.7.10@nlp-toolset"

# Get user folders set up.
RUN mkdir -p /usr/share/tomcat7/nlptoolset/nlprepos
RUN mkdir -p /usr/share/tomcat7/nlptoolset/db
RUN mkdir -p /var/lib/tomcat7/webapps/nlptoolset

VOLUME /var/lib/docker

ADD start-nlp-toolset.sh /opt/start-nlp-toolset.sh
RUN chmod +x /opt/start-nlp-toolset.sh

EXPOSE 3000

ENTRYPOINT ["/opt/start-nlp-toolset.sh"]
