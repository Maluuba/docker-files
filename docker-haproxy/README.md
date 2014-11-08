# docker-haproxy

Dockerfile for setting up [Docker](https://github.com/dotcloud/docker) container with [HAProxy](http://www.haproxy.org/) installed.


## Pulling

    $ docker pull maluuba/haproxy

## Running

    $ docker run -d -p 80:80 -p 443:443 -i -t maluuba/haproxy

Then point your browser at [http://localhost/haproxy?stats](http://localhost/haproxy?stats)
or [http://192.168.59.103/haproxy?stats](http://192.168.59.103/haproxy?stats) if you are using boot2docker

Optionally you can create a local folder with haproxy.cfg and certificates added into it

    $mkdir /local/hapoxy
    $vim /local/haproxy/haproxy.cfg

    
    $ docker run -d -p 80:80 -v /local/haproxy:/etc/haproxy -i -t maluuba/haproxy

## Building

From sources:

    $ docker build github.com/maluuba/docker-haproxy
    
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
