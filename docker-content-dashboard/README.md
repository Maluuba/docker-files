## Maluuba Content Dashboard


This repository contains **Dockerfile** of [Node.js](https://nodejs.org/) for [Docker](https://www.docker.com/) for Content Dashboard



### Usage Example

    docker run --cap-add SYS_PTRACE -it -p 1337:1337 --rm --name=content-dashboard -v {Source code location}:/src maluuba/content-dashboard

The previous command would give 1337 port to the dashboard


## Author

  * Xichao Jia (<xichao.jia@maluuba.com>)

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
