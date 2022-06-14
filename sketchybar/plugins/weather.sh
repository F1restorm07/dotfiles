#!/usr/bin/env bash

WEATHER="$(curl -s 'wttr.in/Denver?format=%c%f')"
LABEL="$(echo $WEATHER | cut -d " " -f 2)"
ICON="$(echo "${WEATHER:0:1}")"

echo $LABEL
echo $ICON

sketchybar -m --set $NAME label=$LABEL

