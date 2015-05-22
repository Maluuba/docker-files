#!/bin/bash

set -e

REPO_DIR=/NapiWebsite
INIT_SCRIPT_PATH=$REPO_DIR/init.sh

if [ -f $INIT_SCRIPT_PATH ];
then
	echo "Running custom init script: $INIT_SCRIPT_PATH"
	chmod +x $INIT_SCRIPT_PATH
	$INIT_SCRIPT_PATH
else
	echo "WARNING: No init script found at $INIT_SCRIPT_PATH"
fi

source /etc/profile.d/rvm.sh

cd $REPO_DIR

rm -rf tmp/pids/server.pid

rvm use ruby-1.9.3

bundle install

rake db:migrate

if [ "${RAILS_ENV}" == 'production' ]; then
	echo "production environment not supported yet"
	exit 1
else
	rails server --port=8080&
	sleep 3
fi

curl localhost:8080 || echo "Not up yet"

bash
