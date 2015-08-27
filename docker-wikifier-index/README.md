# Maluuba Wikifier Index #

Deploy Maluuba's Wikifier using a Docker container.

## Usage ##

This container inderits from the [the Docker Hub Elasticsearch page][docker_es].

    docker run -d \
        -v elasticsearch.yml:/etc/elasticsearch/elasticsearch.yml:ro \
        -v /home/ec2-user/data:/usr/share/elasticsearch/data:ro \
        --name=wikifier-index \
        maluuba/wikifier-index

[docker_es]: https://hub.docker.com/_/elasticsearch

### Setting up an AWS server ###

* Install Docker
```
sudo yum install docker
sudo service docker restart
```
* Set up the EBS volume
```
lsblk
# Find the one you want.
# Set up the filesystem if there is none.
sudo file -s $name | grep -vE "$name: data\$" || sudo mkfs -t ext4 $name
mount_point=/home/ec2-user/data
mkdir -p $mount_point
sudo mount $name $mount_point
# Mount on reboot.
# Backup /etc/fstab
sudo cp /etc/fstab /etc/fstab.orig
echo "$name    $mount_point    ext4    defaults,nofail    0    2" | sudo tee -a /etc/fstab
sudo mount -a
# Maybe chown --recursive elasticsearch:elasticsearch $mount_point
```

## Author ##

  * Justin Harris ([github.com/juharris](http://github.com/juharris))

## LICENSE ##

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
