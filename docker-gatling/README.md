DockerFiles
===========

All the docker files to deploy [Gatling](http://gatling.io/) in a docker container.

### Usage

    docker run -v <conf>:/opt/gatling/conf \
               -v <results>:/opt/gatling/results \
               -v <user-files>:/opt/gatling/user-files -it maluuba/gatling

## Building

To build the image, simply invoke

    docker build github.com/maluuba/docker-gatling

A prebuilt container is also available in the docker index

    docker pull maluuba/gatling
    
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
    
