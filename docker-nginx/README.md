## Nginx Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/maluuba/nginx/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/). We use a source compile of Nginx and Openssl which supports Elliptic curve cryptography.



### Usage

    docker run -d -p 80:80 maluuba/nginx

#### Attach persistent/shared directories

    docker run -d -p 80:80 -p 443:443 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx maluuba/nginx

After few seconds, open `http://<host>` to see the welcome page.
