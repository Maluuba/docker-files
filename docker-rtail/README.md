DockerFiles
===========

Runs [rtail](https://github.com/kilianc/rtail) in a docker container. Expected to be linked with a rtail-server.

### Usage

Uses default server UDP port 9999.

Expects to be linked to a rtail-server, that is a docker `--link` with alias `rtail-server`, which effectively puts an `rtail-server` alias entry in `/etc/hosts` that points to the server host.

Each log file will be piped to its own rtail instance with the id set to the path of the file.

Work in Progress. Currently handles tomcat (Catalina.out) and jetty (Y_m_d.stderrout.log, i.e. 2015_07_07.stderrout.log) style log filenames in multi-level directories.
That is, filenames that are static but undergo logrotate, or logs that also rollover everyday as the filename is timestamped (UTC). Supports new logs appearing that weren't there at container startup time. Only looks at the current day logs, older logs' rtail are closed.
Ideally, just abstract the pattern to an environment variable and run it through the same mechanisms.

```
# Run rtail
#
# Specify rtail-server to link to. Make sure the alias is 'rtail-server'. I.e. --link <container name/id>:rtail-server
#
# Specify volume to mount to '/logs'. Can be multiple logs in multiple directories.
#
$docker run -dit --name=rtail --link rtail-server -v <path to log directory>:/logs maluuba/rtail
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
    