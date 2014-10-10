## Maluuba Nginx


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/maluuba/nginx/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/). We use a source compile of Nginx and Openssl which supports Elliptic curve cryptography.



### Usage

    docker run -d -p 80:80 maluuba/nginx

#### Attach persistent/shared directories

    docker run -d -p 80:80 -p 443:443 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx maluuba/nginx

After few seconds, open `http://<host>` to see the welcome page.

## Author

  * Usman Ismail (<usman.ismail@maluuba.com>)

## LICENSE

Copyright 2014 Maluuba

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.    
