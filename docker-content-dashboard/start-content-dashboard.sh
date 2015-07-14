#!/bin/bash
export NODE_ENV=production
mkdir -p /var/log/node/ && touch /var/log/node/node.log
cd /src
npm install
npm run build
npm run start
bash
