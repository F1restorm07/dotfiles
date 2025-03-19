#!/bin/sh
# ^^ bash is unable to perform floating point math

# volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d':' -f2)
# strip decimal from wpctl
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d'.' -f2)
# convert decimal into a percentage
# form_volume=$(printf "%.0f" "$(($volume*100))")

# notif format --
# app_name replace_id notif_icon summary body actions hints expiration
gdbus call --session \
    --dest=org.freedesktop.Notifications \
    --object-path=/org/freedesktop/Notifications \
    --method=org.freedesktop.Notifications.Notify \
    "Pipewire" 1 "" 'Volume' "$volume%" \
    "[]" '{"urgency": <1>}' 500
