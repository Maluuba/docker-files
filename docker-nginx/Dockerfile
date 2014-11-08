FROM ubuntu
MAINTAINER Maluuba Infrastructure Team <infrastructure@maluuba.com>

EXPOSE 80
EXPOSE 443

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install gcc libpcre3 libpcre3-dev zlib1g-dev make

ADD nginx-openssl.tar.gz /tmp/
ADD nginx.conf /usr/local/nginx/conf/nginx.conf
ADD start-nginx.sh /opt/start-nginx.sh

RUN chmod 700 /opt/start-nginx.sh

WORKDIR /tmp/nginx-openssl/openssl-1.0.1i
RUN ./config

WORKDIR /tmp/nginx-openssl/nginx-1.7.5-maluuba
RUN ./configure.sh
RUN make
RUN make install
RUN ln -s /lib/x86_64-linux-gnu/libpcre.so.3 /lib/x86_64-linux-gnu/libpcre.so.0
ENV LD_LIBRARY_PATH /lib/x86_64-linux-gnu/
RUN useradd nginx
 
# Define mountable directories.
VOLUME ["/usr/local/nginx/conf/sites-enabled", "/usr/local/nginx/conf/certs", "/usr/local/nginx/conf/conf.d", "/var/log/nginx"]

# Define default command.
CMD ["/opt/start-nginx.sh"]

