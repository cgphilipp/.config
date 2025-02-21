#!/usr/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"

pkill waybar

while true; do
    waybar &
    inotifywait -e create,modify $CONFIG_FILES
    pkill waybar
done
