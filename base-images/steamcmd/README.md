# SteamCMD Docker Image

[![Nightly Docker Image](https://github.com/dedicatedgames/docker-images/actions/workflows/publish-docker-images.yaml/badge.svg?event=schedule)](https://github.com/dedicatedgames/docker-images/actions/workflows/publish-docker-images.yaml) ![Docker Pulls](https://img.shields.io/docker/pulls/dedicatedgames/steamcmd) ![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/dedicatedgames/steamcmd)

[Dockerfile](https://github.com/dedicatedgames/docker-images/blob/master/base-images/steamcmd/Dockerfile)

## Description

"The Steam Console Client or SteamCMD is a command-line version of the Steam client. Its primary use is to install and update various dedicated servers available on Steam using a command-line interface. It works with games that use the SteamPipe content system. All games have been migrated from the deprecated HLDSUpdateTool to SteamCMD." Source: [Steam Console Client](https://developer.valvesoftware.com/wiki/SteamCMD) 

The docker image gets built nightly, and as part of the build dowwnloads the latest updates for steamcmd.

The intention of this docker image is to be used as a base for other docker images, but it can also be used by itself.

## Usage

The docker image runs as the `steam` user with a `uid` of `9999`

`docker run -it --name steamcmd dedicatedgames/steamcmd bash`
