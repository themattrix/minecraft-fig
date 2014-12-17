minecraft-fig
=============

Example of a Minecraft server, map generator, and map web server orchestrated with Fig.
Directly inspired by Michael Crosby's *[Advanced Docker Volumes](http://crosbymichael.com/advanced-docker-volumes.html)* blog post.

Usage:

    $ fig up -d map game    # once
    # fig up -d overviewer  # periodically

> Run the `overviewer` container periodically (perhaps with a cron job) to ensure that the map is kept up to date.

The Minecraft server is hosted on port 25565, and the map web server on 25566.
