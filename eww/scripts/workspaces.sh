#!/bin/sh
# https://github.com/taylor85345/garden-hyprland-dotfiles/blob/master/hypr/garden/bar/scripts/workspace

workspaces() {
        unset -v \
                o1 o2 o3 o4 o5 o6 o7 o8 o9 \
                f1 f2 f3 f4 f5 f6 f7 f8 f9

        for num in $(hyprctl workspaces | grep ID | awk '{print $3}'); do
                export o"$num"="$num"
        done

        for num in $(hyprctl monitors | grep -B 4 "active: yes" | awk 'NR==1{print $3}'); do
                export f"$num"="$num"
        done

        echo "(event box :onscroll \"echo {} | sed -e 's/up/-1/g' -e s/down/+1/g | xargs hyprctl dispatch workspace\" \
                (box :class \"workspaces\" :orientation \"h\" :spacing 5 :spaces-evenly \"true\"                      \
                        (button :onclick \"~/.config/hypr/workspace 1\" :class \"0$o1$f1\" \"\")\
                        (button :onclick \"~/.config/hypr/workspace 2\" :class \"0$o2$f2\" \"\")\
                        (button :onclick \"~/.config/hypr/workspace 3\" :class \"0$o3$f3\" \"\")\
                        (button :onclick \"~/.config/hypr/workspace 4\" :class \"0$o4$f4\" \"\")\
                        (button :onclick \"~/.config/hypr/workspace 5\" :class \"0$o5$f5\" \"\")\
                        (button :onclick \"~/.config/hypr/workspace 6\" :class \"0$o6$f6\" \"\")\
                        (button :onclick \"~/.config/hypr/workspace 7\" :class \"0$o7$f7\" \"\")\
                        (button :onclick \"~/.config/hypr/workspace 8\" :class \"0$o8$f8\" \"\")\
                        (button :onclick \"~/.config/hypr/workspace 9\" :class \"0$o9$f9\" \"\")\
                )\
        )"
}

workspaces

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do
workspaces
done
