FROM webdizz/baseimage-java8:8u31

# Remove unnecessary services
RUN rm -rf /etc/service/cron /etc/service/sshd

# Install mark2 dependencies
RUN apt-get update \
    && apt-get -y install \
        git gawk libssl-dev python-dev python-feedparser \
        python-psutil python-twisted-core python-twisted-mail \
        python-twisted-web python-twisted-words python-urwid \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install mark2
RUN git clone https://github.com/gsand/mark2.git \
    && ln -s $PWD/mark2/mark2 /usr/bin/mark2

RUN update-locale LANG=en_US.UTF-8 LC_MESSAGES=en_US.UTF-8
RUN mkdir /minecraft

VOLUME /minecraft/volumes
EXPOSE 25565

WORKDIR /minecraft
ADD run.sh /minecraft/

CMD ["/sbin/my_init", "--skip-startup-files", "--quiet", "--", "bash", "run.sh"]
