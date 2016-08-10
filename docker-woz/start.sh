#!/bin/bash

set -ex

# Set up a mirror to avoid overwriting the actual host's node_modules and symlink issues.
mkdir /woz-mirror
ls /WozDashboard/ | xargs -I% -n1 ln -s /WozDashboard/% /woz-mirror/%
ln -s /WozDashboard/.sailsrc /woz-mirror/.sailsrc
rm -rf /woz-mirror/node_modules

cd /woz-mirror
npm install

if [ "${NODE_ENV}" == "production" ]; then
	npm run build
	npm start
else
	npm run dev&
	sleep 10
	npm start
fi
