#!/bin/sh

player_status=$(playerctl --player spotify,%any status 2> /dev/null)
artist=$(playerctl --player spotify,%any metadata artist)
title=$(playerctl --player spotify,%any metadata title)
if [ "$player_status" = "Playing" ]; then
    echo " <b>${artist}</b> - ${title}"
elif [ "$player_status" = "Paused" ]; then
    echo " <b>${artist}</b> - ${title}"
fi
