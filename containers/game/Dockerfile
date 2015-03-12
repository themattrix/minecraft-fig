FROM n3ziniuka5/ubuntu-oracle-jdk:14.04-JDK7

RUN mkdir /minecraft
ADD run.sh /minecraft/run.sh

VOLUME /minecraft/world
VOLUME /minecraft/settings
WORKDIR /minecraft

ENV MINECRAFT_VERSION 1.8.3

RUN wget -O /minecraft/minecraft.jar \
        https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_VERSION/minecraft_server.$MINECRAFT_VERSION.jar \
    && chmod +x /minecraft/minecraft.jar

CMD ["bash", "run.sh"]
