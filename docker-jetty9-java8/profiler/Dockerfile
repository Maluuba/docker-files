FROM maluuba/jetty9-java8
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>


ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV NEW_JAVA_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,address=62911,server=y,suspend=n \
              -Dcom.sun.management.jmxremote=true \
              -Dcom.sun.management.jmxremote.ssl=false \
              -Dcom.sun.management.jmxremote.authenticate=false \
              -Dcom.sun.management.jmxremote.rmi.port=1898 \
              -Dcom.sun.management.jmxremote.port=1098

COPY jstatd.all.policy $JAVA_HOME/jstatd.policy
COPY start-jetty-profiler.sh /opt/start-jetty-profiler.sh
RUN chmod +x /opt/start-jetty-profiler.sh
RUN echo "JAVA_OPTIONS=\"\${JAVA_OPTS} ${NEW_JAVA_OPTS} \""  >> /etc/default/jetty

EXPOSE 1099
EXPOSE 1098
EXPOSE 1898
EXPOSE 62911

ENTRYPOINT ["/opt/start-jetty-profiler.sh"]
