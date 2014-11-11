storm
=============
A Dockerfile for deploying a [Storm](http://storm.incubator.apache.org/) cluster under [supervision](http://supervisord.org/) using [Docker](https://www.docker.io/)
 containers. 

The image is registered to the [Docker Index](https://index.docker.io/u/maluuba/storm/)

Installation
------------
1. Install [Docker](https://www.docker.io/)
2. Pull the Docker image : ```docker pull maluuba/storm```

Usage
-----
**Pre-Requisites:** You must have a running zookeeper instance in order to start any of the storm daemons. 
```
docker run -p 2181:2181 -p 2888:2888 -p 3888:3888 -h zookeeper –-name="zookeeper" -d jplock/zookeeper;
```

The image contains an **ENTRYPOINT** for running one container per storm daemon as follow:
  
```docker run [OPTIONS] --link zookeeper:zk -d maluuba/storm --daemon (nimbus, drpc, supevisor, ui, logviewer)```  

For instance to run Nimbus :

```
docker run \  
      --name="storm-nimbus" -h nimbus \  
      --expose 6627 --expose 3772 --expose 3773 \  
      --link zookeeper:zk \  
      -d maluuba/storm \  
      --daemon nimbus
```
Makefiles
---------
You can use the `Makefile` for directly building and deploying storm.

To rebuild the **maluuba/storm** image just run :

  - ```make storm-build```

Run the following commands to deploy/destroy your cluster.

  - ```make deploy-cluster```
  - ```make deploy-cluster HOST_MOUNT=/home/ec2-user/deployment```
  - ```make destroy-cluster```


How to submit a topology 
------------------------
Without storm installed on your machine:

```
docker run --rm --entrypoint storm  \  
       -v <HOST_TOPOLOGY_TARGET_DIR>:/deployment maluuba/storm \   
       -c nimbus.host=`docker inspect --format='{{.NetworkSettings.IPAddress}}' storm-nimbus` jar <TOPOLOGY_JAR> <TOPOLOGY_CLASS> <TOPOLOGY_ARGS>
```

Port binding 
-------------

Storm UI/Logviewer container ports are exposed to the host system : 

  - Storm UI : [http://localhost:49002/](http://localhost:49002/)
  - Logviewer : [http://localhost:49003/](http://localhost:49003/)


Troubleshooting
---------------
If for some reasons you need to debug a container you can use [nsenter](https://github.com/jpetazzo/nsenter): 

```
PID=$(docker inspect --format {{.State.Pid}} <container_name_or_ID>)
nsenter --target $PID --mount --uts --ipc --net --pid
```
