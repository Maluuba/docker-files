DockerFiles
===========

A dockerfile for hosting Nominatim, where the postgres database is on an EBS

### Usage

Create a `config.sh` with the appropriate variables, use `config.sh.template` as a starter. Important to fillout the `websiteurl`, `originaluid`, and `originalgid`

Discover where your EBS mount is: `sudo fdisk -l` Suppose it is at `/dev/xvdb`

Mount the EBS: `mkdir -p /opt/disk/; sudo mount /dev/xvdb /opt/disk/`

Run the Docker
```
$docker run --name="nominatim" -p 80:80 -v /home/ec2-user/config.sh:/app/config.sh -v /opt/disk:/app/disk/ -it -d maluuba/docker-nominatim
```

## Building

To build the image, simply invoke

    docker build github.com/maluuba/docker-nominatim

A prebuilt container is also available in the docker index

    docker pull maluuba/nominatim
    

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
