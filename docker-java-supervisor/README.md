DockerFiles
===========

A dockerfile for a long executing jar monitored by supervisord

### Usage

```
# Place your executable.jar in a local directory called data and add it as a volume 
#
# Optionally add a startup script at data/init.sh and it will be run inside the 
#     container before the jar is executed
#
$docker run -v data:/data -d maluuba/java-supervisor
```

## Building

To build the image, simply invoke

    docker build github.com/maluuba/docker-java-supervisor

A prebuilt container is also available in the docker index

    docker pull maluuba/java-supervisor
    

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
    
