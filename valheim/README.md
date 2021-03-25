# Valheim Docker Image

## Description

Dockerized [Valheim](https://www.valheimgame.com/) Dedicated Server

The docker image is based on the `dedicatedgames/steamcmd:latest` image.

The docker image gets built nightly, and as part of the build dowwnloads the latest updates for steamcmd.

## Configuration

### Environment Variables

> SERVER_NAME 

__DEFAULT:__ `Dedicated Games Valheim`

The name of your server that will be visible in the Server list.

> SERVER_PORT

__Default:__ `2456-2457`

Choose the Port which you want the server to communicate with. Valheim uses the specified Port AND specified Port+1. 

> SERVER_PUBLIC 

__Default:__ `0`

Sets the visibility of your server. 

`1` will make the server visible in the browser. 

`0` will make the server invisible and only joinable via the ‘Join IP’ button.


> SERVER_WORLD 

__Default:__ `DedicatedGames`

A World with the name entered will be created. You may also choose an already existing World by entering its name.

> SERVER_PASSWORD 

__Default:__ _Random Value_

Sets the password. If you don't provide one a ranom password will be generated and outputed to the conosle. _Note that the password will be regenerated each time the container launches if you dont specify one._

> SAVE_DATA_DIR 

__Default:__ `/home/steam/valheim/data`

Overrides the default save path where Worlds and permission-files are stored.

### Example usage

The docker image runs as the `steam` user with a `uid` of `9999`

```
docker run \
--name valheim \
-p 2456 \
-p 2457 \
-e SERVER_PASSWORD=changeme
-e SERVER_NAME=MyValheimServer \
-e SERVER_WORLD=MyWorld \
dedicatedgames/valheim
```
