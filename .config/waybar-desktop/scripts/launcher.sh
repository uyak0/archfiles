#!/bin/sh

active=$(hyprctl clients | grep rofi)

if [ -z "$active" ]; then
    ~/.config/rofi/launchers/type-2/launcher.sh
else
    pkill rofi
fi
