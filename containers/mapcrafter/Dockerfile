FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /

RUN apt-get update && \
    apt-get -y install python curl wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "deb http://packages.mapcrafter.org/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/mapcrafter.list && \
    wget -O /etc/apt/trusted.gpg.d/mapcrafter.gpg http://packages.mapcrafter.org/ubuntu/keyring.gpg

RUN apt-get update && \
    apt-get -y install mapcrafter && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD render.conf ./

CMD ["mapcrafter", "-c", "./render.conf", "-j", "2"]
