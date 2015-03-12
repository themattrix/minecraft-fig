FROM node:slim

RUN npm install -g http-server

VOLUME  /www
WORKDIR /www

# Run web server, hosting the content of /www on port 25566
CMD ["http-server", "./", "-p", "25566"]
