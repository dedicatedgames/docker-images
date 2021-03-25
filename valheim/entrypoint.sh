#!/usr/bin/env bash

if [ -z "$SERVER_PASSWORD" ]
then
  SERVER_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
  echo "SERVER_PASSWORD wasn't provided, setting to $SERVER_PASSWORD"
else
  echo "SERVER_PASSWORD provided"
fi

~/valheim/server/valheim_server.x86_64 \
    -name "$SERVER_NAME" \
    -port $SERVER_PORT \
    -world "$SERVER_WORLD" \
    -password "$SERVER_PASSWORD" \
    -savedir "$SAVE_DATA_DIR" \
    -public "$SERVER_PUBLIC"