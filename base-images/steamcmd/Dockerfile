FROM debian:buster-slim

# Setup the steam user
ARG PUID=9999
ENV USER steam
ENV HOMEDIR "/home/${USER}"
ENV STEAMCMDDIR "${HOMEDIR}/steamcmd"
RUN useradd -u "${PUID}" -m "${USER}"

# Install the steamcmd package
RUN sed -i 's/$/ contrib non-free/' /etc/apt/sources.list \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
    && echo steam steam/question select "I AGREE" | debconf-set-selections \
    && echo steam steam/license note '' | debconf-set-selections \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
        libcurl4-gnutls-dev:i386 \
        ca-certificates \
        libsdl2-2.0-0:i386 \
		lib32gcc1 \
        steamcmd \
		tini \
	&& apt-get clean autoclean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*

# Switch to the steam user, and add the "/usr/games" directory to it's path
USER ${USER}
ENV PATH "$PATH:/usr/games"

# Perform an initial update
RUN steamcmd +quit
