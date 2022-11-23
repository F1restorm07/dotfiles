#!/bin/sh
#https://github.com/iSparsh/gross/blob/main/eww/scripts/search.sh

list=$(ls /usr/bin/ | grep -m 10 -i "$1")
buf=""

for l in list; do
        buf="$buf (button :class \"item\" :onclick \"$1 &\" \"$1\")"
done
echo "(box
        :orientation \"v\"
        :spacing 5 :class \"apps\"
        :halign \"center\"
        :valign \"center\"
        $buf
)" > ~/.config/eww/scripts/search_items.txt
