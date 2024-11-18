#!/bin/bash

get_brightness() {
    max_brightness=$(brightnessctl m)
    current_brightness=$(brightnessctl g)
    if [ "$max_brightness" -eq 0 ]; then
        echo 0
    else
        awk -v cur="$current_brightness" -v max="$max_brightness" 'BEGIN {printf "%.0f\n", (cur / max) * 100}'
    fi
}

get_icon() {
    local brightness=$1
    if [ "$brightness" -ge 90 ]; then
        echo "%{F#F02E6E}%{F-}"
    elif [ "$brightness" -ge 70 ]; then
        echo "%{F#F02E6E}%{F-}"
    elif [ "$brightness" -ge 50 ]; then
        echo "%{F#F02E6E}%{F-}"
    elif [ "$brightness" -ge 30 ]; then
        echo "%{F#F02E6E}%{F-}"
    else
        echo "%{F#F02E6E}%{F-}"
    fi
}

case "$1" in
    up)
        brightnessctl set +5%
        ;;
    down)
        brightnessctl set 5%-
        ;;
    get)
        brightness=$(get_brightness)
        icon=$(get_icon "$brightness")
        echo "$icon %{F#000000}$brightness%{F-}%"
        ;;
    *)
        echo "Usage: $0 {up|down|get}"
        exit 1
        ;;
esac
