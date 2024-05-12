#!/bin/sh

active=$(hyprctl clients | grep pavucontrol)

if [ -z "$active" ]; then
    pavucontrol
else
    pkill pavucontrol
fi

