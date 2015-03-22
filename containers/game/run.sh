#!/bin/bash

#
# Copy settings into the /minecraft directory and then launch Minecraft.
#
# Assumption: current working directory is /minecraft
#

# Exit if any line fails
set -e
set -o pipefail

function minecraft() {
    java -Xmx1536M -Xms1536M -jar minecraft.jar nogui
}

# Copy all settings into the Minecraft folder
cp -f settings/* .

# If the white-list.{txt,json} file exists and is non-empty, enable white-listing.
if [[ -s "white-list.txt" ]] || [[ -s "white-list.json" ]]; then
    sed -i -s -e '/^white-list=/{s/=false/=true/}' "server.properties"
fi

# Accept the EULA so the server runs.
echo "eula=true" > eula.txt

minecraft
