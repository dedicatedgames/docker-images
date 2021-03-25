FROM dedicatedgames/steamcmd:latest

ENV LD_LIBRARY_PATH "/home/steam/valheim/server/linux64:$LD_LIBRARY_PATH"
ENV SERVER_PUBLIC 0
ENV SERVER_NAME "Dedicated Games Valheim"
ENV SERVER_PORT 2456
ENV SERVER_WORLD "DedicatedGames"
ENV SAVE_DATA_DIR "/home/steam/valheim/data"
ENV SteamAppId 892970



# Install Valheim

RUN steamcmd \
  +login anonymous \
  +force_install_dir /home/steam/valheim/server \
  +app_update 896660 \
  +exit

RUN mkdir -p $SAVE_DATA_DIR
VOLUME ${SAVE_DATA_DIR}

#Copy 64bit steamclient, since it keeps using 32bit
# RUN cp /home/steam/steamcmd/linux64/steamclient.so /home/steam/valheim/server/

EXPOSE 2456/udp
EXPOSE 2456/tcp
EXPOSE 2457/udp
EXPOSE 2457/tcp

COPY --chown=steam:steam entrypoint.sh /home/steam/
ENTRYPOINT ["tini", "--", "/home/steam/entrypoint.sh" ]
