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

# Ruby, JRuby, and RVM
# Default to production, as per the README, this can be overriden in `docker run` by adding "-e RAILS_ENV=development"
ENV RAILS_ENV production 
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL get.rvm.io | bash -s stable
RUN bash -l -c "rvm requirements"
RUN bash -l -c "rvm install jruby-1.7.10"
RUN echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
RUN bash -l -c "source /etc/profile.d/rvm.sh"
RUN bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN bash -l -c "rvm use --create jruby-1.7.10@nlp-toolset"
# Help cache gems even though the NlpToolset repo has the most up to date Gemfile's this still helps.
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bash -l -c "bundle install"

# Get user folders set up.
RUN mkdir -p /usr/share/tomcat7/nlptoolset/nlprepos
RUN mkdir -p /usr/share/tomcat7/nlptoolset/db
RUN chown -R tomcat7:tomcat7 /usr/share/tomcat7/nlptoolset

EXPOSE 8080

ADD start-nlp-toolset.sh /opt/start-nlp-toolset.sh
RUN chmod +x /opt/start-nlp-toolset.sh

ENTRYPOINT ["bash", "-c", "/opt/start-nlp-toolset.sh"]
