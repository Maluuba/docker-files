DockerFiles
===========

All the docker files to deploy [Apache Tomcat 7](http://tomcat.apache.org/download-70.cgi) in a docker container.

### Usage

```
# Place your war file(s) in local directory called deployment and add it as a volume 
#
# Optionally specify JAVA_OPTS to be added to default JAVA_OPTS for tomcat
#
# Optionally specify a custom Xmx parameter to replace default setting for tomcat
#
# Optionally add a startup script at deployment/init.sh and it will be run inside the 
#     container before tomcat comes up
#
$docker run --cap-add SYS_PTRACE -it -p 8080:8080 -e JAVA_OPTS='-Dsome.property=value' 
    -e Xmx=2048m -v deployment:/deployment maluuba/tomcat7
```
Note: Add sys trace capacity to get arround the tomcat init.d script bug. See [Docker issue 6800](https://github.com/docker/docker/issues/6800) for details.

Then point your browser at [http://localhost:8080/](http://localhost:8080/)

or [http://192.168.59.103:8080/](http://192.168.59.103:8080/) if you are using boot2docker

## Building

To build the image, simply invoke

    docker build github.com/maluuba/docker-tomcat7

A prebuilt container is also available in the docker index

    docker pull maluuba/tomcat7
    
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
    
