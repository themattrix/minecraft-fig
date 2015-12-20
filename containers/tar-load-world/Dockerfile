FROM alpine:latest

# proper init
ADD https://github.com/krallin/tini/releases/download/v0.8.4/tini-static /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# world data and settings expected to be mounted here
WORKDIR /volumes

CMD ["tar", "-xz", "--no-same-owner"]
