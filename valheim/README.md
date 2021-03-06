# Valheim Docker Image

[![Nightly Docker Image](https://github.com/dedicatedgames/docker-images/actions/workflows/publish-docker-images.yaml/badge.svg?event=schedule)](https://github.com/dedicatedgames/docker-images/actions/workflows/publish-docker-images.yaml) ![Docker Pulls](https://img.shields.io/docker/pulls/dedicatedgames/valheim) ![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/dedicatedgames/valheim)

[Dockerfile](https://github.com/dedicatedgames/docker-images/blob/master/valheim/Dockerfile)

## Description

Dockerized [Valheim](https://www.valheimgame.com/) Dedicated Server

The docker image is based on the `dedicatedgames/steamcmd:latest` image.

The docker image gets built nightly, and as part of the build dowwnloads the latest updates for steamcmd.

## Configuration

### Environment Variables

> SERVER_NAME

**DEFAULT:** `Dedicated Games Valheim`

The name of your server that will be visible in the Server list.

> SERVER_PORT

**Default:** `2456-2457`

Choose the Port which you want the server to communicate with. Valheim uses the specified Port AND specified Port+1.

> SERVER_PUBLIC

**Default:** `0`

Sets the visibility of your server.

`1` will make the server visible in the browser.

`0` will make the server invisible and only joinable via the ‘Join IP’ button.

> SERVER_WORLD

**Default:** `DedicatedGames`

A World with the name entered will be created. You may also choose an already existing World by entering its name.

> SERVER_PASSWORD

**Default:** _Random Value_

Sets the password. If you don't provide one a ranom password will be generated and outputed to the conosle. _Note that the password will be regenerated each time the container launches if you dont specify one._

> SAVE_DATA_DIR

**Default:** `/home/steam/valheim/data`

Overrides the default save path where Worlds and permission-files are stored.

### Example usage

The docker image runs as the `steam` user with a `uid` of `9999`. If you choose to mount a volume make sure that the uid of `9999` has access to read and write.

```
docker run \
--name valheim \
-p 2456/udp \
-p 2457/udp \
-e SERVER_PASSWORD=changeme \
-e SERVER_NAME=MyValheimServer \
-e SERVER_WORLD=MyWorld \
-v ~/valheim_data:/home/steam/valheim/data \
dedicatedgames/valheim
```
