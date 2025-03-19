#!/bin/sh

backlight=$(ls /sys/class/backlight)
brightness=$(brightnessctl i $backlight | grep -o "[0-9]*%")

gdbus call --session \
    --dest=org.freedesktop.Notifications \
    --object-path=/org/freedesktop/Notifications \
    --method=org.freedesktop.Notifications.Notify \
    "Brightnessctl" 2 "" 'Brightness' "$brightness" \
    "[]" '{"urgency": <1>}' 500
