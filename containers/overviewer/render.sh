#!/bin/bash

# Render the maps
overviewer.py \
    --rendermodes=smooth-lighting,smooth-night,cave \
    /minecraft/world /www
