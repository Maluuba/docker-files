DockerFiles
===========

Runs [rtail](https://github.com/kilianc/rtail) in a docker container. Expected to be linked with a rtail-server.

### Usage

Uses default server UDP port 9999.

Expects to be linked to a rtail-server, that is a docker `--link` with alias `rtail-server`, which effectively puts an `rtail-server` alias entry in `/etc/hosts` that points to the server host.

Each log file will be piped to its own rtail instance with the id set to the path of the file.

Handles log filenames given by environment variables (`FILES_IREGEX` and `WATCH_IREGEX`) which contain a case insensitive regex pattern.
Note that the variable will be evaluated to support function calls, be sure to escape properly.

Supports new logs appearing that weren't there at container startup time; the environment variables are reevaluated during each refresh.
Motivation is some logs undergo logrotate, or their names change (i.e. like a UTC timestamp), and you only want todays logs (since rtail doesn't persist anything).

An example with node.js (node.log), tomcat (Catalina.out), and jetty (Y_m_d.stderrout.log, i.e. 2015_07_07.stderrout.log). New log files will be picked up, but only those with todays date will be sent to rtail.
```
FILES_IREGEX='.*catalina\\.out\\\|.*node\\.log\\\|.*`date +"%Y_%m_%d_%s"`.*\\.log'
WATCH_IREGEX='.*catalina\\.out\\\|.*\\.log'
```

```
# Run rtail
#
# Specify rtail-server to link to. Make sure the alias is 'rtail-server'. I.e. --link <container name/id>:rtail-server
#
# Specify volume to mount to '/logs'. Can be multiple logs in multiple directories.
#
# Optionally specify -e FILES_IREGEX to set log pattern for selecting files for rtail. Defaults to any path ending in .log
#
# Optionally specify -e WATCH_IREGEX to set log pattern for watching for changes in the log directory. Defaults to any path ending in .log
#
$docker run -dit --name=rtail --link rtail-server -v <path to log directory>:/logs maluuba/rtail
# For remote connectivity, use
$docker run -dit --name=rtail ---add-host=rtail-server:${RTAIL_SERVER_IP} -v <path to log directory>:/logs maluuba/rtail
```

Then check out your logs from the [rtail-server](/docker-rtail-server)

## Building

To build the image, simply invoke within the repo

    docker build -t rtail .

A prebuilt container is also available in the docker index

    docker pull maluuba/rtail
    
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
