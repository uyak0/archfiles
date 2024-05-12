#!/bin/sh

while true
do
    player_status=$(playerctl -p spotify status 2> /dev/null)

    if [ "$player_status" = "Playing" ]; then
        artist=$(playerctl -p spotify metadata artist)
        title=$(playerctl -p spotify metadata title)
        echo '{"text": "'"$artist - $title"'", "class": "custom-spotify", "alt": "Spotify"}'
    elif [ "$player_status" = "Paused" ]; then
        echo '{"text": "'"Paused"'", "class": "custom-spotify", "alt": "Spotify (Paused)"}'
    fi
    if [ "$player_status" = "" ]; then
        echo '{"text": "'"Offline"'", "class": "custom-spotify", "alt": "Spotify Offline"}'
    fi
sleep 3
done
