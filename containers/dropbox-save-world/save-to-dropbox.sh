#!/bin/bash

set -e -o pipefail

if [ ! -f "/volumes/dropbox/.dropbox_uploader" ]; then
    echo "[ERROR] Missing config file for Dropbox Uploader, see README."
    exit 1
fi

tar -czf "/root/world.tar.gz" \
    --exclude='*.lock' \
    --exclude='.git' \
    "game/world" \
    "game/world_nether" \
    "game/world_the_end" \
    "game/spigot" \
    "game/settings-custom"

dropbox_uploader.sh -p -h -f "/volumes/dropbox/.dropbox_uploader" \
    upload "/root/world.tar.gz" "world.tar.gz"
