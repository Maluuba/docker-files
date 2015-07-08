DockerFiles
===========

Runs a [rtail-server](https://github.com/kilianc/rtail) in a docker container.

### Usage

Defaults listening to ANYADDR (0.0.0.0) hostname, as incoming will be coming from the docker bridge, not localhost.

UDP ports (default 9999), not exposed as you can just `--link` a rtail [client] to the rtail-server

```
# Run a rtail-server
#
# Optionally specify DEBUG to set log settings.
#
$docker run -dit -p 8888:8888 -e DEBUG=rtail:*  maluuba/rtail-server
```

Then point your browser at [http://localhost:8888/](http://localhost:8888/)

## Building

To build the image, simply invoke within the repo

    docker build -t rtail-server .

A prebuilt container is also available in the docker index

    docker pull maluuba/rtail-server
    
## Author

  * Matthew Dixon (<matthew.dixon@maluuba.com>)

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
    
