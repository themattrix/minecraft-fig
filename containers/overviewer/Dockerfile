FROM debian:7.7

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install python curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Minecraft Overviewer
RUN echo "deb http://overviewer.org/debian ./" >> /etc/apt/sources.list
RUN curl http://overviewer.org/debian/overviewer.gpg.asc | apt-key add -
RUN apt-get update \
    && apt-get -y install minecraft-overviewer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download the normal Minecraft jar, since Overviewer uses the textures from it
ENV HOME /
ENV MINECRAFT_VERSION 1.8.1
ENV MINECRAFT_DL_URL  https://s3.amazonaws.com/Minecraft.Download/versions
ENV MINECRAFT_JAR_URL ${MINECRAFT_DL_URL}/${MINECRAFT_VERSION}/${MINECRAFT_VERSION}.jar
ENV MINECRAFT_JAR_DST /.minecraft/versions/${MINECRAFT_VERSION}/${MINECRAFT_VERSION}.jar
RUN mkdir -p $(dirname ${MINECRAFT_JAR_DST})
RUN curl ${MINECRAFT_JAR_URL} -o ${MINECRAFT_JAR_DST}

# Add render script to kick off Overviewer
ADD render.sh /render.sh

# Run Overviewer
CMD ["bash", "render.sh"]
