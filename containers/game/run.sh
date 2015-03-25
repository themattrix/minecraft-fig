#!/bin/bash

#
# Copy settings into the /minecraft directory and then launch Minecraft.
#
# Assumption: current working directory is /minecraft
#

set -e
set -o pipefail

readonly SPIGOT_BUILDTOOLS_URL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
readonly SPIGOT_SRC="/minecraft/volumes/spigot/spigot.jar"
readonly SPIGOT_DST="/minecraft/spigot.jar"

function in_temp_dir() {
    local temp_dir=$(mktemp -d)

    function cleanup() {
        cd && rm -rf "${temp_dir}"
    }

    (trap cleanup EXIT; cd "${temp_dir}"; "$@")
}

function spigot_exists() {
    [ -f "${SPIGOT_SRC}" ]
}

function build_spigot() {
    wget "${SPIGOT_BUILDTOOLS_URL}"
    HOME=$PWD java -jar BuildTools.jar
    mv Spigot/Spigot-Server/target/spigot-*.jar "${SPIGOT_SRC}"
}

function ensure_spigot() {
    if ! spigot_exists; then
        in_temp_dir build_spigot
    fi

    cp "${SPIGOT_SRC}" "${SPIGOT_DST}"
}

function main() {
    # Create expected volume subdirectories
    mkdir -p volumes/{world,settings-default,settings-custom,spigot}

    # Copy default settings
    if ls volumes/settings-default/* &> /dev/null; then
        cp -f volumes/settings-default/* .
    fi

    # Symlink custom settings, stomping defaults
    if ls volumes/settings-custom/* &> /dev/null; then
        ln -sf volumes/settings-custom/* .
    fi

    # Copy the mark2.properties files to the expected location.
    mkdir -p /etc/mark2 && cp -L mark2.properties /etc/mark2/mark2.properties

    # Make the world data available to Minecraft
    ln -s volumes/world world

    # Accept the EULA so that the server runs.
    echo "eula=true" > eula.txt

    # Build and/or copy spigot to /minecraft/spigot.jar
    ensure_spigot

    # Start the Minecraft server.
    mark2 start

    # Block while Mark2 is running.
    while ps ax | grep -sqF mark2; do
        sleep 1
    done

    # Attempt to stop the server *just in case* it still happens to be running.
    mark2 stop &> /dev/null || true
}

main "$@"
