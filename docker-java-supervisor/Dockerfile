# Supervisor with java7

FROM dockerfile/java:oracle-java7

RUN \
  apt-get update && \
  apt-get install -y supervisor && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

ADD jar-supervisor.conf /etc/supervisor/conf.d/jar-supervisord.conf

WORKDIR /etc/supervisor/conf.d

ADD start-supervisor.sh /opt/start-supervisor.sh
RUN chmod +x /opt/start-supervisor.sh

ENTRYPOINT ["/opt/start-supervisor.sh"]
