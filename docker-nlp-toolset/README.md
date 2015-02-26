DockerFiles
===========

All the docker files to deploy the NLP Toolset.

### Usage

Get the NlpToolset (https://github.com/Maluuba/NlpToolset) repository and follow the set up directions for passwords and keys in its README.

Here is the basic command to start the NLP Toolset.  You can see the Xmx lower if you need to but 3g is recommended.

```
docker run --cap-add SYS_PTRACE \
  -it -p 8080:8080 \
  -e _JAVA_OPTIONS="-Xmx3g" \
  -v ~/workspace/NlpToolset:/NlpToolset \
  -v /path/to/.m2/settings.xml:/usr/share/tomcat7/.m2/settings.xml \
  --name=nlp_toolset --rm \
  maluuba/nlp-toolset
```

Or with Boot2Docker on Windows:

```
docker run --cap-add SYS_PTRACE \
  -it -p 8080:8080 \
  -e _JAVA_OPTIONS="-Xmx3g" \
  -v /c/Users/username/Documents/workspace/NlpToolset:/NlpToolset \
  -v /c/Users/username/.m2/settings.xml:/usr/share/tomcat7/.m2/settings.xml --name=nlp_toolset --rm \
  maluuba/nlp-toolset
```

For example (with Boot2Docker on Windows):

```
docker run --cap-add SYS_PTRACE \
  -it -p 8080:8080 \
  -e _JAVA_OPTIONS="-Xmx3g" \
  -v /c/Users/justin/Documents/workspace/NlpToolset:/NlpToolset \
  -v /c/Users/justin/.m2/settings.xml:/usr/share/tomcat7/.m2/settings.xml \
  --name=nlp_toolset --rm \
  maluuba/nlp-toolset
```

When doing local tests for changes to the NlpToolset you should run in development mode and re-use your existing git keys, Maven cache, and workspace.  Here is a template command:

```
docker run --cap-add SYS_PTRACE \
  -it -p 8080:8080 \
  -e _JAVA_OPTIONS="-Xmx3g" \
  -e RAILS_ENV=development \
  -v /path/to/workspace/NlpToolset:/NlpToolset \
  -v /path/to/.m2:/root/.m2 \
  -v /path/to/.ssh:/tmp/ssh_mounted_keys \
  -v /path/to/workspace:/NlpToolset/nlprepos/justin@maluuba.com/Maluuba --name=nlp-toolset --rm maluuba/nlp-toolset
```

For example:

```
docker run --cap-add SYS_PTRACE \
  -it -p 8080:8080 \
  -e _JAVA_OPTIONS="-Xmx3g" \
  -e RAILS_ENV=development \
  -v /c/Users/justin/Documents/workspace/NlpToolset:/NlpToolset \
  -v /c/Users/justin/.m2:/root/.m2 \
  -v /c/Users/justin/.ssh:/tmp/ssh_mounted_keys \
  -v /c/Users/justin/Documents/workspace:/NlpToolset/nlprepos/justin@maluuba.com/Maluuba \
  --name=nlp-toolset --rm \
  maluuba/nlp-toolset
```

Note: Add sys trace capacity to get around the tomcat init.d script bug. See [Docker issue 6800](https://github.com/docker/docker/issues/6800) for details.

Note: With Boot2Docker, you may notice that accessing your workspace is slow so you might prefer to use a workspace that is just on the Boot2Docker VM rather than one mounted to your actual OS.

Then point your browser at [http://localhost:3000/](http://localhost:3000/) or [http://192.168.59.103:3000/](http://192.168.59.103:3000/) if you are using Boot2Docker.

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
    
