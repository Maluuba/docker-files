orientdb-docker
===============

A dockerfile for creating an orientdb image with :

  - explicit orientdb version (2.0.8) for image cache stability
  - init by supervisord
  - config, databases and backup folders expected to be mounted as volumes

And lots of information from my orientdb+docker explorations. Read on!


Building the image on your own
------------------------------

1. Checkout this project to a local folder cding to it

2. Build the image:
  ```bash
docker built -t <YOUR_DOCKER_HUB_USER>/orientdb:2.0.8 .
```

3. Push it to your Docker Hub repository (it will ask for your login credentials):
  ```bash
docker push <YOUR_DOCKER_HUB_USER>/orientdb:2.0.8
```


Running orientdb
----------------

To run the image, run:

```bash
docker run --name orientdb -d -v <config_path>:/opt/orientdb/config -v <databases_path>:/opt/orientdb/databases -v <backup_path>:/opt/orientdb/backup -p 2424:2424 -p 2480:2480 maluuba/orientdb:2.0.8
```

The docker image contains a unconfigured orientdb installation and for running it you need to provide your own config folder from which OrientDB will read its startup settings.

Optionally, if the server-config file contains an empty user section `<users></users>`, you can set the root server password with `-e ORIENTDB_ROOT_PASSWORD=<PASS>` by adding it to the command above.

The same applies for the databases folder which if local to the running container would go away as soon as it died/you killed it.

The backup folder only needs to be mapped if you activate that setting on your OrientDB configuration file.


OrientDB distributed
--------------------

If you're running OrientDB distributed* you won't have the problem of losing the contents of your databases folder since they are already replicated to the other OrientDB nodes. From the setup above simply leave out the "--volumes-from orientdb_databases" argument and OrientDB will use the container storage to hold your databases' files.

*note: some extra work might be needed to correctly setup hazelcast running inside docker containers ([see this discussion](https://groups.google.com/forum/#!topic/vertx/MvKcz_aTaWM)).

