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
    java -Xmx1024M -Xms1024M -jar minecraft.jar nogui 2>&1 | tee server.out
}

# Link all settings into the Minecraft folder
ln -sf settings/* .

minecraft

if grep -sq "You need to agree to the EULA" server.out; then
    sed -i -s -e 's/eula=false/eula=true/' eula.txt
    minecraft
fi
