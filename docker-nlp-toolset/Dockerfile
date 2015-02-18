FROM maluuba/tomcat7
MAINTAINER Maluuba NLP Team <nlp@maluuba.com>

RUN apt-get install -qqy git docker.io

RUN apt-get -qq install maven

RUN mvn -X

# Ruby
RUN curl -sSL get.rvm.io | bash -s stable
RUN type rvm | head -n 1 | grep "rvm is a( shell)? function"
RUN echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
RUN rvm list known
RUN rvm install jruby-1.7.10
RUN rvm list
RUN rvm use --create jruby-1.7.10@nlp-toolset
RUN bundle install

sudo adduser `whoami` rvm

# Production mode
RUN [RAILS_ENV=production] rake db:migrate

# Get user folders set up.
RUN mkdir -p /usr/share/tomcat7/nlptoolset/nlprepos
RUN mkdir -p /usr/share/tomcat7/nlptoolset/db
RUN mkdir -p /var/lib/tomcat7/webapps/nlptoolset

VOLUME /var/lib/docker

ADD start-nlp-toolset.sh /opt/start-nlp-toolset.sh
RUN chmod +x /opt/start-nlp-toolset.sh

# TODO port mapping?
EXPOSE 81

ENTRYPOINT ["/opt/start-nlp-toolset.sh"]
