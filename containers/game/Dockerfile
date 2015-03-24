FROM webdizz/baseimage-java8:8u31

# Remove unnecessary services
RUN rm -rf /etc/service/cron /etc/service/sshd

# Install mark2 dependencies
RUN apt-get update \
    && apt-get -y install \
        git libssl-dev python-dev python-feedparser \
        python-psutil python-twisted-core python-twisted-mail \
        python-twisted-web python-twisted-words python-urwid \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install mark2
RUN git clone https://github.com/gsand/mark2.git \
    && ln -s $PWD/mark2/mark2 /usr/bin/mark2

RUN update-locale LANG=en_US.UTF-8 LC_MESSAGES=en_US.UTF-8

RUN mkdir /minecraft

# Build Spigot
RUN mkdir /build && ( \
       cd /build \
       && wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar \
       && HOME=$PWD java -jar BuildTools.jar \
       && cp Spigot/Spigot-Server/target/spigot-*.jar /minecraft/spigot.jar \
    )  && rm -rf /build

VOLUME /minecraft/world
WORKDIR /minecraft
ADD . /minecraft/

RUN mkdir /etc/mark2 \
    && mv /minecraft/settings/* /minecraft/ \
    && mv /minecraft/mark2.properties /etc/mark2/mark2.properties

CMD ["/sbin/my_init", "--skip-startup-files", "--quiet", "--", "bash", "run.sh"]
