#!/bin/bash
xrandr --output HDMI-1 --off
xrandr --output HDMI-2 --off
xrandr --output eDP-1 --mode 1920x1080 --primary
bspc desktop Desktop --remove
bspc monitor HDMI-1 -r
bspc monitor HDMI-2 -r
bspc wm -r 
