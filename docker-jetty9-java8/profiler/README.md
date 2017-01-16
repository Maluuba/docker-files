# docker-jetty9-java8:profiler

Dockerfile for setting up [Docker](https://github.com/docker/docker) container with [Jetty](http://www.eclipse.org/jetty/) installed.

## Pulling

    $ docker pull maluuba/jetty9-java8:profiler

## Running

    $ docker run -d -p 8080:8080 -i -t maluuba/jetty9-java8:profiler

Then point your browser at [http://localhost:8080/](http://localhost:8080/)
or [http://192.168.59.103:8080/](http://192.168.59.103:8080/) if you are using boot2docker

## Building

From sources:

    $ docker build github.com/maluuba/docker-jetty9-java8/profiler
    
## Author

  * Nick Ma (http://github.com/nma)

## LICENSE

Copyright 2016 Maluuba

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.    
