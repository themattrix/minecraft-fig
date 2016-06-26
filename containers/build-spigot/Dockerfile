FROM anapsix/alpine-java:jdk8

# proper init
ADD https://github.com/krallin/tini/releases/download/v0.9.0/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# additional dependencies for building Spigot
RUN apk --update add git

RUN mkdir /build
WORKDIR /build
VOLUME /output
ADD build.sh /build.sh

CMD ["bash", "/build.sh"]
