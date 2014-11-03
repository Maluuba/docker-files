FROM dockerfile/java:oracle-java8

# create directory for gatling install
RUN mkdir -p /opt/gatling

RUN mkdir -p /tmp/downloads
WORKDIR /tmp/downloads
ADD gatling-2.0.1.zip /tmp/downloads/gatling.zip 
RUN unzip gatling.zip
RUN mv gatling-charts-highcharts-2.0.1/* /opt/gatling/
RUN rm -rf gatling-charts-highcharts-2.0.1

# change context to gatling directory
WORKDIR /opt/gatling

VOLUME ["/opt/gatling/conf","/opt/gatling/results","/opt/gatling/user-files"]


# Set environment variables
ENV PATH /opt/gatling/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV GATLING_HOME /opt/gatling

ENTRYPOINT ["gatling.sh"]
