FROM debian:7.7

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install python \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME  /www
WORKDIR /www

# Run web server, hosting the content of /www on port 25566
CMD ["python", "-m", "SimpleHTTPServer", "25566"]
