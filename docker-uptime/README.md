docker-uptime
=============

A dockerized [Uptime](https://github.com/fzaninotto/uptime) Container

## Usage

```
# Run MongoDB
docker run -d --name mongodb dockerfile/mongodb

# Run Uptime and link MongoDB
docker run -d -p 8082:8082 --name uptime --link mongodb:mongodb -i -t maluuba/docker-uptime

# Run Uptime and link MongoDB with custom Database Password
docker run -d -p 8082:8082 --name uptime --link mongodb:mongodb -i -t maluuba/docker-uptime <DB Password>
```
Then point your browser at [http://localhost:8082/](http://localhost:8082/)

or [http://192.168.59.103:8082/](http://192.168.59.103:8082/) if you are using boot2docker

## Custom Initilization Script

If you would like to run a custom intilization script to setup environment before uptime is run please create a shell script called init-uptime.sh and load it into container at __/tmp/uptime__ using the volume switch.

```
# Create Script
mkdir uptime
vim uptime/init-uptime.sh

# Mount Script into uptime container
docker run -d -p 8082:8082 --name uptime --link mongodb:mongodb -v uptime:/tmp/uptime -i -t maluuba/docker-uptime
```

## Custom Configuration

If you would like to use custom configuration please create config files and load it into container at __/tmp/uptime/config/__ using the volume switch. You can use [config_template.yaml](https://github.com/Maluuba/docker-uptime/blob/master/config_template.yaml) as a base for your custom config. Note that unless you have your own mongo instance please leave the MONGO_SERVER and MONGO_PASSWORD keywords intact so they can be replaced by the setup scripts. 

```
# Create Config
mkdir -p uptime/config
vim uptime/config/default.yaml

# Mount Script into uptime container
docker run -d -p 8082:8082 --name uptime --link mongodb:mongodb -v uptime:/tmp/uptime -i -t maluuba/docker-uptime
```

## Building

To build the image, simply invoke

    docker build --tag=uptime github.com/Maluuba/docker-uptime

A prebuilt container is also available in the docker index

    docker pull maluuba/docker-uptime
    
## Author

  * Usman Ismail (<usman.ismail@maluuba.com.com>)

## LICENSE

Copyright 2014 Usman Ismail

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    
