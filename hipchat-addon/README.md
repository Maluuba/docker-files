Docker Hipchat Addon Service
===========

A docker container which runs hipcaht addon service as detailed in the [Quick Start Tutorial](https://www.hipchat.com/docs/apiv2/quick_start). 

### Usage

```
# Basic usage
$docker run -it --name hipchat_addon -v maluuba/hipchat-addon
 * Stopping NTP server ntpd                                              [ OK ]
 * Starting NTP server ntpd                                              [ OK ]
 * Restarting daemon monitor monit                                       [ OK ]

Tunnel established at https://5a3f56c.ngrok.com

Stopping redis-server: redis-server.
Starting redis-server: redis-server.

> maluuba-addon-key@0.1.0 web-dev /etc/hipchat/addon
> nodemon --harmony -e js,json,css,hbs web.js

16 Dec 20:01:18 - [nodemon] v1.2.1
16 Dec 20:01:18 - [nodemon] to restart at any time, enter `rs`
16 Dec 20:01:18 - [nodemon] watching: *.*
16 Dec 20:01:18 - [nodemon] starting `node --harmony web.js`
info: Atlassian Connect add-on started at https://5a3f56c.ngrok.com

```
## Building

To build the image, simply invoke

    docker build github.com/maluuba/docker-files/hipchat-addon

A prebuilt container is also available in the docker index

    docker pull maluuba/hipchat-addon
    
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
    
