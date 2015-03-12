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
    java -Xmx1024M -Xms1024M -jar minecraft.jar nogui
}

# Link all settings into the Minecraft folder
ln -sf settings/* .

echo "eula=true" > eula.txt
minecraft
