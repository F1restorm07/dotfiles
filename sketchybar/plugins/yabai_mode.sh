#!/usr/bin/env bash

case "$(yabai -m query --spaces --display | jq -r 'map(select(."has-focus" == true).type)')" in
    bsp)
    sketchybar -m --set yabai_mode icon=""
    ;;
    stack)
    sketchybar -m --set yabai_mode icon="﯅"
    ;;
    float)
    sketchybar -m --set yabai_mode icon=""
    ;;
esac
