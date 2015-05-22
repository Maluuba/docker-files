DockerFiles
===========

All the docker files to deploy the nAPI Webiste.

### Usage

Get the website (https://github.com/Maluuba/NapiWebsite) repository and follow the set up directions for passwords and keys in its README.

Here is the basic command to start the website.

```
docker run \
  -it -p 8080:8080 \
  -v ~/workspace/NapiWebsite:/NapiWebsite \
  --name=napi-website --rm \
  maluuba/napi-website
```

Or with Boot2Docker on Windows:

```
docker run \
  -it -p 8080:8080 \
  -v /c/Users/username/Documents/workspace/NapiWebsite:/NapiWebsite \
  --name=napi-website --rm \
  maluuba/napi-website
```

For example (with Boot2Docker on Windows):

```
docker run \
  -it -p 8080:8080 \
  -v /c/Users/justin/Documents/workspace/NapiWebsite:/NapiWebsite \
  --name=napi-website --rm \
  maluuba/napi-website
```

When doing local tests you should run in development.  Here is a template command:

```
docker run \
  -it -p 8080:8080 \
  -e RAILS_ENV=development \
  -v /path/to/workspace/NapiWebsite:/NapiWebsite \
  --name=napi-website --rm \
  maluuba/napi-website
```

Note: Add sys trace capacity to get around the tomcat init.d script bug. See [Docker issue 6800](https://github.com/docker/docker/issues/6800) for details.

Point your browser at [http://localhost:8080/](http://localhost:8080/) or [http://192.168.59.103:8080/](http://192.168.59.103:8080/) if you are using Boot2Docker.

## Building

To build the image, simply invoke

    docker build github.com/maluuba/docker-napi-website

A prebuilt container is also available in the docker index

    docker pull maluuba/napi-website
    
## Author

  * Justin Harris (github.com/juharris)

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
    
