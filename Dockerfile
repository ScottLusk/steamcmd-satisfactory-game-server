FROM cm2network/steamcmd:latest

USER root

LABEL maintainer="scott.t.lusk@gmail.com"

ENV STEAMAPPID 1690800
ENV STEAMAPPDIR /home/steam/satisfactoryserver
ENV STEAMSCRIPTDIR /home/steam/scripts

VOLUME [${STEAMAPPDIR}/config]
EXPOSE 7777
EXPOSE 15000
EXPOSE 15777

CMD ${STEAMSCRIPTDIR}/steam_update.sh && \
	${STEAMSCRIPTDIR}/configure_server.sh && \
	${STEAMSCRIPTDIR}/start_server.sh

RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
		locales \
		libicu63 \
		libgdiplus \
		libsdl2-2.0-0 \
		jq && \
	sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen

ADD src ${STEAMSCRIPTDIR}

RUN ${STEAMSCRIPTDIR}/steam_update.sh
