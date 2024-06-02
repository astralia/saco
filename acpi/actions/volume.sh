#!/bin/sh

# MIT license - astralia 2021

mute() {
    cur=$(amixer get Master | grep "\[o" | sed -e 's/^.\+\[\(on\|off\)\]/\1/g')
    if [ $cur == "off" ]; then
        amixer -q set Master unmute
    else
        amixer -q set Master mute
    fi
}

down() {
    amixer -q set Master 1-
}

up() {
    amixer -q set Master 1+
}

case $1 in 
    mute) mute;;
    down) down;;
    up) up;;
    *) ;;
esac
