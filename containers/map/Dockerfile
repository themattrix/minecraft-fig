FROM node:slim

# proper init
ADD https://github.com/krallin/tini/releases/download/v0.8.4/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

RUN npm install -g http-server

VOLUME  /www
WORKDIR /www

# Run web server, hosting the content of /www on port 25566
CMD ["http-server", "./", "-p", "25566"]
