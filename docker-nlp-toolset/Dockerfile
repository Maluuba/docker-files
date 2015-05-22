FROM maluuba/tomcat7
MAINTAINER Maluuba NLP Team <nlp@maluuba.com>

# Git
RUN apt-get install -qqy git
RUN apt-get install -qqy openjdk-7-jdk

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
# Use default known_hosts for production.
ADD known_hosts /usr/share/tomcat7/.ssh/known_hosts
ADD Gemfile.lock /tmp/docker_dir/Gemfile.lock
ADD install_rvm.sh /tmp/docker_dir/install_rvm.sh
RUN chmod +x /tmp/docker_dir/install_rvm.sh
RUN /tmp/docker_dir/install_rvm.sh

# Training libraries
# LIBSVM
ENV LIBSVM_PATH /tmp/LIBSVM
RUN mkdir -p $LIBSVM_PATH \
    && curl http://www.csie.ntu.edu.tw/~cjlin/libsvm/libsvm-3.20.tar.gz \
    | tar xvz --directory $LIBSVM_PATH \
    && cd $LIBSVM_PATH/libsvm-* \
    && make \
    && cp svm-train /usr/local/bin/ \
    && cp svm-predict /usr/local/bin/

# CRFPP 0.58
ENV CRFPP_PATH /tmp/CRFPP
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
RUN mkdir -p $CRFPP_PATH \
    && curl 'https://doc-08-74-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/adkmvuevnfj1kg6q6g655e5d4m0tg0t4/1432310400000/13553212398903315502/*/0B4y35FiV1wh7QVR6VXJ5dWExSTQ?e=download' \
    | tar xvz --directory $CRFPP_PATH \
    && cd $CRFPP_PATH/CRF* \
    && ./configure \
    && make \
    && make install

# Get user folders set up.
RUN mkdir -p /usr/share/tomcat7/nlptoolset/nlprepos
RUN mkdir -p /usr/share/tomcat7/nlptoolset/db
RUN chown -R tomcat7:tomcat7 /usr/share/tomcat7/nlptoolset

# TODO Install rvm for tomcat7

EXPOSE 8080

ADD start-nlp-toolset.sh /opt/start-nlp-toolset.sh
RUN chmod +x /opt/start-nlp-toolset.sh

ENTRYPOINT ["bash", "-c", "/opt/start-nlp-toolset.sh"]
