#!/bin/sh
# https://github.com/taylor85345/garden-hyprland-dotfiles/blob/master/hypr/garden/bar/scripts/workspace
# https://github.com/IllustratedMan-code/dotfiles/blob/main/eww/scripts/workspace.sh

$MONITOR=$1
active() {
        ic=(0    )
        class=(0 inactive inactive inactive inactive)

        for workspace in $(hyprctl monitors | awk 'BEGIN{RS="\n\n"}; {print $4$10}'); do
                if [ ${workspace:0:1} == $MONITOR ]; then
                        ic[${workspace:0-1}]=""
                        class[${workspace:0-1}]="active"
                fi
        done
        export ic
        export class
}

active
workspaces() {
        # o - occupied, f - focused
        unset -v \
                o1 o2 o3 o4 o5 o6 o7 o8 o9 \
                f1 f2 f3 f4 f5 f6 f7 f8 f9

        for num in $(hyprctl workspaces | grep ID | awk '{print $3}'); do
                export o"$num"="$num"
        done

        # for num in $(hyprctl monitors | grep -B 4 "active: yes" | awk 'NR==1{print $3}'); do
        #         export f"$num"="$num"
        # done

        echo "(eventbox :onscroll \"echo {} | sed -e 's/up/-1/g' -e s/down/+1/g | xargs hyprctl dispatch workspace\" \
                (box :class \"workspaces\" :orientation \"v\" :spacing 5 :space-evenly \"true\"                      \
                        (button :onclick \"~/.config/eww/scripts/workspace 1\" :class \"${class[1]}\" \"${ic[1]}\")\
                        (button :onclick \"~/.config/eww/scripts/workspace 2\" :class \"${class[2]}\" \"${ic[2]}\")\
                        (button :onclick \"~/.config/eww/scripts/workspace 3\" :class \"${class[3]}\" \"${ic[3]}\")\
                        (button :onclick \"~/.config/eww/scripts/workspace 4\" :class \"${class[4]}\" \"${ic[4]}\")\
                        (button :onclick \"~/.config/eww/scripts/workspace 5\" :class \"${class[5]}\" \"${ic[5]}\")\
                )\
        )"
}

workspaces

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do
active
workspaces
done
