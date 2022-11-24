#!/bin/sh

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do
        echo $(hyprctl activewindow | awk '/title:/ {print $NF}')
done
