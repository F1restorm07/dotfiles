#!/bin/sh

battery=$(upower -i /org/freedesktop/UPower/devices/battery_macsmc_battery | grep percentage | awk '{print $2}')
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume:" | awk -F'/' '{print $2}')
brightness=$(brightnessctl -d apple-panel-bl | grep brightness -m1 | awk '{print $4}' | tr -d '()')
