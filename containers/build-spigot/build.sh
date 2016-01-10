#!/bin/bash

set -e -o pipefail

readonly SPIGOT_BUILDTOOLS="BuildTools.jar"
readonly SPIGOT_BUILDTOOLS_URL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/${SPIGOT_BUILDTOOLS}"
readonly SPIGOT_OUTPUT="/output/spigot.jar"

in_temp_dir() (
    local temp_dir=$(mktemp -d)

    cleanup() {
        cd && rm -rf "${temp_dir}"
    }

    trap cleanup EXIT
    cd "${temp_dir}"

    "${@}"
)

build_spigot() {
    # grab the BuildTools jar
    wget "${SPIGOT_BUILDTOOLS_URL}"

    # perform the build (this takes a while)
    HOME=${PWD} java -jar "${SPIGOT_BUILDTOOLS}"

    # move the built Spigot jar to the output directory
    mv -v Spigot/Spigot-Server/target/spigot-*.jar "${SPIGOT_OUTPUT}"

    # set the appropriate ownership of the Spigot jar
    if [ -n "${UID}" ] && [ -n "${GID}" ]; then
        chown "${UID}:${GID}" "${SPIGOT_OUTPUT}"
    fi
}

main() {
    in_temp_dir build_spigot
}

main
