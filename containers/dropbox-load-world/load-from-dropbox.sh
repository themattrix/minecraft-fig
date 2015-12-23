#!/bin/bash

set -e -o pipefail

if [ ! -f "/volumes/dropbox/.dropbox_uploader" ]; then
    echo "[ERROR] Missing config file for Dropbox Uploader, see README."
    exit 1
fi

if [ -d "game/world" ]; then
    world_owner=$(stat -c '%u:%g' "game/world")
fi

for w in "game/world" "game/world_nether" "game/world_the_end"; do
    if [ -d "${w}" ]; then mv -n "${w}" "${w}.bak"; fi
done

dropbox_uploader.sh -p -h -f "/volumes/dropbox/.dropbox_uploader" \
    download "world.tar.gz" "/root/world.tar.gz"

tar -xzf "/root/world.tar.gz" --no-same-owner
rm -rf game/world*.bak

if [ -n "${world_owner}" ]; then
    chown -R "${world_owner}" game/world*
fi
