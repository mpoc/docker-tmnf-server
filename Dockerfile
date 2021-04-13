FROM alpine:3
WORKDIR /tmnf-server
COPY TrackmaniaServer_2011-02-21.zip .
RUN apk add --no-cache unzip && unzip TrackmaniaServer_2011-02-21.zip && rm TrackmaniaServer_2011-02-21.zip

EXPOSE 2350/tcp
EXPOSE 2350/udp
EXPOSE 3450/tcp
EXPOSE 3450/udp

ENTRYPOINT ["/tmnf-server/TrackmaniaServer", "/game_settings=MatchSettings/custom_match_settings.txt", "/dedicated_cfg=dedicated_cfg.txt", "/nodaemon", "/internet"]
