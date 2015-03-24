#!/bin/bash

#
# Copy settings into the /minecraft directory and then launch Minecraft.
#
# Assumption: current working directory is /minecraft
#

# Exit if any line fails
set -e
set -o pipefail

# If the white-list.{txt,json} file exists and is non-empty, enable white-listing.
if [[ -s "white-list.txt" ]] || [[ -s "whitelist.json" ]]; then
    sed -i -s -e '/^white-list=/{s/=false/=true/}' "server.properties"
fi

# Accept the EULA so the server runs.
echo "eula=true" > eula.txt

# Start the Minecraft server.
mark2 start

# Block while the server is running.
while ps ax | grep -sqF mark2; do
    sleep 5
done
