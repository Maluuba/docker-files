#!/bin/bash
export NODE_ENV=production
cd /src
npm install
npm run start&
npm run build
bash
