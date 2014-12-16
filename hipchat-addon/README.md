Docker Hipchat Addon Service
===========

A docker container which runs hipcaht addon service as detailed in the [Quick Start Tutorial](https://www.hipchat.com/docs/apiv2/quick_start). This installs all tools required inside the container including redis and nodejs.

## Usage

##### Basic Usage
Will run the default sample project which echos ```Hi, [Your Name]``` when you type /hello

    $docker run -it --name hipchat_addon maluuba/hipchat-addon
        * Stopping NTP server ntpd                                              [ OK ]
        * Starting NTP server ntpd                                              [ OK ]
        * Restarting daemon monitor monit                                       [ OK ]

        Tunnel established at https://xxxxxxxx.ngrok.com

        Stopping redis-server: redis-server.
        Starting redis-server: redis-server.

        > maluuba-addon-key@0.1.0 web-dev /etc/hipchat/addon
        > nodemon --harmony -e js,json,css,hbs web.js

        16 Dec 20:01:18 - [nodemon] v1.2.1
        16 Dec 20:01:18 - [nodemon] to restart at any time, enter `rs`
        16 Dec 20:01:18 - [nodemon] watching: *.*
        16 Dec 20:01:18 - [nodemon] starting `node --harmony web.js`
        info: Atlassian Connect add-on started at https://xxxxxxxx.ngrok.com

##### Custom Source Files
Add any custom nodejs source files and mount them into the container at /src/addon to get custom code to run in the container.

    $docker run -it --name hipchat_addon -v /src/addon:/src/addon maluuba/hipchat-addon

#### Integration

1.    Log in to hipchat.com.
2.    Click the Rooms tab.
3.    Click the My Rooms tab.
4.    Click the link to the room in which you want to install the add-on.
5.    Click the Integrations link.
6.    Click the Build and install your own integration link.
7.    In the Integration URL field, enter the secure tunnel's URL and append "/addon/capabilities" to the URL. For example:
8.    https://xxxxxxxx.ngrok.com/addon/capabilities
9.    Click Add integration.

#### Test Your addon


1.    Click the Summary link.
2.    Click Open in web app.
3.    Type /hello in the chat field.
4.    The message, "Hi, " appears in the chat.


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
    
