#!/bin/sh

# MIT license - astralia 2021

path="/sys/class/backlight/intel_backlight"
cur_file="$path/brightness"
cur=$(cat $cur_file)
max=$(cat $path/max_brightness)
min=0
mod=1000

down() {
    n=$(($cur-$mod))
    if [ $n -gt $min ]; then
        echo $n > $cur_file
    else
        echo $min > $cur_file
    fi
}

up() {
    n=$(($cur+$mod))
    if [ $n -lt $max ]; then
        echo $n > $cur_file
    else
        echo $max > $cur_file
    fi
}

case $1 in
    down) down;;
    up) up;;
    *) ;;
esac
