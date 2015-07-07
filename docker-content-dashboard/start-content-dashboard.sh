#!/bin/bash
export NODE_ENV=production
cd /src
npm install
npm run build
npm run start
bash
