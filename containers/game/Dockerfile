FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# Install the add-apt-repository command
RUN apt-get update \
    && apt-get -y install software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add the Oracle Java installer
RUN add-apt-repository -y ppa:webupd8team/java

# Tell the Java installer to run silently
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true"   | debconf-set-selections

# Install Java 7
RUN apt-get update \
    && apt-get -y install oracle-java7-installer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /minecraft
ADD run.sh /minecraft/run.sh

VOLUME /minecraft/world
VOLUME /minecraft/settings
WORKDIR /minecraft

ENV MINECRAFT_VERSION 1.8.1

ADD https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_VERSION/minecraft_server.$MINECRAFT_VERSION.jar /minecraft/minecraft.jar
RUN chmod +x /minecraft/minecraft.jar

CMD ["bash", "run.sh"]
