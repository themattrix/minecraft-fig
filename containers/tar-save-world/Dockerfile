FROM alpine:latest

# proper init
ADD https://github.com/krallin/tini/releases/download/v0.14.0/tini-static /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# world data and settings expected to be mounted here
WORKDIR /volumes

CMD ["tar", "-c", "--exclude=*.lock", "game/world", "game/world_nether", "game/world_the_end", "game/spigot", "game/settings-custom"]
