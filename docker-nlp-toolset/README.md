DockerFiles
===========

All the docker files to deploy the NLP Toolset.

### Usage

Set the password in NlpToolset/config/environments/production.rb

Optionally add a startup script at NlpToolset/init.sh and it will be run inside the container before tomcat comes up.

```
docker run --cap-add SYS_PTRACE -it -p 8080:8080 -e Xmx=3g -v ~/workspace/NlpToolset:/NlpToolset --name=nlp_toolset --rm maluuba/nlp-toolset
```

Or with Boot2Docker on Windows:

```
docker run --cap-add SYS_PTRACE -it -p 8080:8080 -e Xmx=3g -v /c/Users/username/Documents/workspace/NlpToolset:/NlpToolset --name=nlp_toolset --rm maluuba/nlp-toolset
```

For example:

```
docker run --cap-add SYS_PTRACE -it -p 8080:8080 -e Xmx=3g -v /c/Users/justin/Documents/workspace/NlpToolset:/NlpToolset --name=nlp_toolset --rm maluuba/nlp-toolset
```

Note: Add sys trace capacity to get around the tomcat init.d script bug. See [Docker issue 6800](https://github.com/docker/docker/issues/6800) for details.

Then point your browser at [http://localhost:3000/](http://localhost:3000/) or [http://192.168.59.103:3000/](http://192.168.59.103:3000/) if you are using boot2docker.

## Building

To build the image, simply invoke

    docker build github.com/maluuba/docker-nlp-toolset

A prebuilt container is also available in the docker index

    docker pull maluuba/nlp-toolset
    
## Author

  * Justin Harris (<github.com/juharris>)

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
    
