#!/usr/bin/bash

DIR="$HOME/Pictures/screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

option2="Selected area"
option3="Fullscreen (delay 2 sec)"

options="$option2\n$option3"

choice=$(echo -e "$options" | wofi -c ~/.config/HyprV/wofi/config-select -s ~/.config/HyprV/wofi/style/select.css -dmenu)

case $choice in
    $option2)
        grim -g "$(slurp)" - | swappy -f -
        notify-send "Screenshot created" "Mode: Selected area"
    ;;
    $option3)
        sleep 2
        grim - | swappy -f -
        notify-send "Screenshot created" "Mode: Fullscreen"
    ;;
esac
