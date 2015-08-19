FROM ubuntu:14.04

RUN apt-get update

# Install basic software
RUN apt-get -y install wget curl sudo

# Note: libgeos++-dev is included here too (the nominatim install page suggests installing it if there is a problem with the 'pear install DB' below - it seems safe to install it anyway)
RUN apt-get -y install build-essential automake
RUN apt-get -y install libxml2-dev
RUN apt-get -y install libgeos-dev
RUN apt-get -y install libpq-dev
RUN apt-get -y install libbz2-dev
RUN apt-get -y install libtool libproj-dev
RUN apt-get -y install libgeos++-dev
RUN apt-get -y install gcc proj-bin libgeos-c1 git osmosis
RUN apt-get -y install php5 php-pear php5-pgsql php5-json
RUN apt-get -y -qq install libboost-all-dev

# Some additional packages that may not already be installed
# bc is needed in configPostgresql.sh
RUN apt-get -y install bc

# Install Postgres, PostGIS and dependencies.
# Note postgres version 9.3 and postgis version 2.1 instead of 9.1 and 1.5 respectively.
RUN apt-get -y install postgresql postgis postgresql-contrib postgresql-9.3-postgis-2.1 postgresql-server-dev-9.3

# Install Apache
RUN apt-get -y install apache2

# Install gdal - which is apparently used for US data (more steps need to be added to this script to support that US data)
RUN apt-get -y install python-gdal

# Add Protobuf support
RUN apt-get -y install libprotobuf-c0-dev protobuf-c-compiler

# Change locale to en_US.UTF-8
RUN locale-gen en_US.UTF-8  
RUN dpkg-reconfigure locales
RUN update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8 
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

RUN mkdir -p /app/nominatim/
# PHP Pear::DB is needed for the runtime website
RUN pear install DB

# Tuning PostgreSQL
ADD configPostgresql.sh /app/configPostgresql.sh
RUN chmod +x /app/configPostgresql.sh
# configPostgresql.sh will be executed at entrypoint

# Get Nominatim software
RUN useradd -m -d /app/nominatim nominatim
RUN chown nominatim: /app/nominatim
WORKDIR /app/nominatim
RUN sudo -u nominatim git clone --recursive https://github.com/twain47/Nominatim.git /app/nominatim/
RUN sudo -u nominatim -s -- cd /app/nominatim && git pull && git submodule update --init
RUN git checkout 138b8a2ada477d878cfca1036d8ec3c7fd37e1db
RUN sudo -u nominatim ./autogen.sh
RUN sudo -u nominatim ./configure
RUN sudo -u nominatim make

# Configure postgresql
# TODO just have this point 
RUN mkdir -p /app/disk/postgresdata/data/
RUN service postgresql stop && \
  pg_dropcluster --stop 9.3 main
RUN pg_createcluster --start -e UTF-8 9.3 main -d /app/disk/postgresdata/data/ -l /app/disk/postgresdata/log && \
  service postgresql start

RUN service postgresql start && \
  sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='nominatim'" | grep -q 1 || sudo -u postgres createuser -s nominatim && \
  sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='www-data'" | grep -q 1 || sudo -u postgres createuser -SDR www-data && \
  sudo -u postgres psql postgres -c "DROP DATABASE IF EXISTS nominatim"

# Adust PostgreSQL to do disk writes
ADD configPostgresqlDiskWrites.sh /app/configPostgresqlDiskWrites.sh
RUN chmod +x /app/configPostgresqlDiskWrites.sh
# configPostgresqlDiskWrites.sh will be executed at entrypoint

# Stopping the services because docker run will be mounting the postgres cluster
RUN service apache2 stop
RUN service postgresql stop

EXPOSE 80

ADD start-nominatim.sh /app/nominatim/start-nominatim.sh
RUN chmod +x /app/nominatim/start-nominatim.sh
ENTRYPOINT ["/app/nominatim/start-nominatim.sh"]
