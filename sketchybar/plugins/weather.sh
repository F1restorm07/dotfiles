#!/usr/bin/env bash

WEATHER="$(curl 'wttr.in/highlands_ranch?u&format=%t')"
ICON="$(curl 'wttr.in/highlands_ranch?u&format=%c')"

echo $WEATHER
echo $ICON

sketchybar -m --set $NAME label=$WEATHER icon=$ICON

