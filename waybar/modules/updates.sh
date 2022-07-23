#!/bin/bash

pkg_updates() {
        system_updates=$(pacman -Qu | wc -l)
        aur_updates=$(aura -Qu | wc -l)
        total_updates=$((system_updates + aur_updates))

        if [ $total_updates == 1 ]; then
                echo -n " 1 update"
        elif [ $updates -ne 0 ]; then
                echo -n " $total_updates updates"
        fi
}

pkg_updates
