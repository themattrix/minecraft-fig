minecraft-fig
=============

Example of a Minecraft server, map generator, and map web server orchestrated with docker-compose (formerly fig).
Directly inspired by Michael Crosby's *[Advanced Docker Volumes](http://crosbymichael.com/advanced-docker-volumes.html)* blog post.

Usage:

    $ docker-compose up -d map game   # once
    # docker-compose up -d mapcrafter # periodically

> Run the `mapcrafter` container periodically (perhaps in a loop or with a cron job) to ensure that the map is kept up to date.

The Minecraft server is hosted on port 25565, and the map web server on 80, although these can be changed in `docker-compose.yml`.


## Custom Server Settings

The default settings are stored in `volumes/game/settings-default/`. You can either change these directly, or override any of these
settings files in `volumes/game/settings-custom/`.

> I like to keep my custom settings in a private repo, which I can then clone to `settings-custom`.
