#!/bin/bash
xrandr --output HDMI-2 --mode 1920x1080 --same-as eDP-1 --scale 1x1
bspc desktop Desktop --remove
bspc wm -r
bspc desktop Desktop --remove
