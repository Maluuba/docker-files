# docker-jetty-java8

Dockerfile for setting up [Docker](https://github.com/dotcloud/docker) container with [Jetty](http://www.eclipse.org/jetty/) installed.

Versions:

* Jetty 8.1.17

## Pulling

    $ docker pull maluuba/jetty-java8

## Running

    $ docker run -d -p 8080:8080 -i -t maluuba/jetty-java8

Then point your browser at [http://localhost:8080/](http://localhost:8080/)
or [http://192.168.59.103:8080/](http://192.168.59.103:8080/) if you are using boot2docker

Optionally you can create a local folder with sub-folders for: webapps, config and contexts. Copy your war files into __webapps__, your context xmls into __contexts__ and any custom config to be copies into ../jetty/etc/ into __config__. In addition if you put a script called init.sh at __/etc/jetty/init.sh__ it will be executed before jetty is run. This can be used to perform any custom setup steps.   

    $mkdir /local/jetty
    $mkdir /local/jetty/webapps
    $mkdir /local/jetty/config
    $mkdir /local/jetty/contexts
    
    $ docker run -d -p 8080:8080 -v /local/jetty:/etc/jetty -i -t maluuba/jetty-java8


    
## Building

From sources:

    $ docker build github.com/maluuba/docker-jetty-java8
    
## Author

  * Justin Harris (http://github.com/juharris)

## LICENSE

Copyright 2015 Maluuba

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.    
