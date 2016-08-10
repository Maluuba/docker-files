## Maluuba WOZ

Instructions to deploy the WOZ tools (currently just the dashboard).

# Usage

Get the [WozDashboard](https://github.com/Maluuba/WozDashboard).

Here is the basic command to start the WOZ tools in production:

```
docker run -it \
  -p 80:1337 \
  -v ~/workspace/WozDashboard:/WozDashboard \
  --name=woz --rm \
  maluuba/woz
```

For development:

```
Here is the basic command to start the WOZ tools in production:

```
docker run -it -p 8080:8080 -p 1337:1337 \
  -v ~/workspace/WozDashboard:/WozDashboard \
  -e NODE_ENV=development \
  --name=woz --rm \
  maluuba/woz
```

Copyright 2016 Maluuba
