#!/bin/sh

while true
do
    player_status=$(playerctl -p chromium status 2> /dev/null)

    if [ "$player_status" = "Playing" ]; then
        title="$(playerctl -p chromium metadata title)"
        if [[ $title =~ "&" ]]; then
            title=${title//&/&amp;}
        fi 
        if [[ $title =~ '"' ]]; then        #fix for issues with quotes in titles that mess with output
            title=${title//\"/'\"'}
        fi
        echo '{"text": "'"$title"'", "class": "custom-youtube", "alt": "Youtube"}'
    elif [ "$player_status" = "Paused" ]; then
        echo '{"text": "'"Paused"'", "class": "custom-youtube", "alt": "Youtube Music (Paused)"}'
    fi
    if [ "$player_status" = "" ]; then
        echo '{"text": "'"Offline"'", "class": "custom-youtube", "alt": "Youtube Music Offline"}'
    fi
sleep 3
done
