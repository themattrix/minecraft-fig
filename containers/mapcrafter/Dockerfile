FROM debian:7.7

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /

RUN apt-get update \
    && apt-get -y install python curl wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD 0xb6f77e28fe4f4eac.key ./
RUN apt-key add 0xb6f77e28fe4f4eac.key

RUN echo "deb http://mapcrafter.org/debian ./" >> /etc/apt/sources.list
RUN apt-get update \
    && apt-get -y install mapcrafter \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD render.conf ./

CMD ["mapcrafter", "-c", "./render.conf", "-j", "2"]
