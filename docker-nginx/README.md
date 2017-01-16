## Maluuba Nginx


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/maluuba/nginx/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/). We use a source compile of Nginx and Openssl which supports Elliptic curve cryptography.



### Usage

    docker run -d -p 80:80 maluuba/nginx

#### Attach persistent/shared directories

    docker run -d -p 80:80 -p 443:443 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx maluuba/nginx

After few seconds, open `http://<host>` to see the welcome page.

#### Build Reproduction
1. Download OpenSSL from https://www.openssl.org/source/
1. SHAsum and PGP verify download
1. Building openssl:
	1. Build using the following options:
	
`
options:  bn(64,64) rc4(16x,int) des(idx,cisc,16,int) idea(int) blowfish(idx)
compiler: gcc -DDSO_DLFCN -DHAVE_DLFCN_H -Wa,--noexecstack -m64 -DL_ENDIAN -DTERMIO -O3 -Wall -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM
OPENSSLDIR: "/home/ec2-user/nginx-1.7.5-maluuba/../openssl-1.0.1i/.openssl/ssl"
`
1. Download nginx from https://nginx.org/en/download.html
	1. Build with the following command: ./configure --with-openssl=../openssl-1.1.0c
1. PGP verify download

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
