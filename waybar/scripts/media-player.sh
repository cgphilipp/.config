#!/usr/bin/bash

player_status=$(playerctl --player spotify,%any status 2> /dev/null)
(($? != 0)) && { exit 1; }

artist=$(playerctl --player spotify,%any metadata artist)
title=$(playerctl --player spotify,%any metadata title)
if [ "$player_status" = "Playing" ]; then
    icon=""
elif [ "$player_status" = "Paused" ]; then
    icon=""
fi

echo "${icon} <b>${artist}</b> - ${title}"
