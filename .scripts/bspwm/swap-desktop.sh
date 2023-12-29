#!/bin/bash
# swaps the current desktop with selected
shift="$1"
current=$(bspc query -D -d --names)

# if same, exit
[[ $shift == $current ]] && exit 1

bspc desktop $shift -n t 
bspc desktop $current -s t 
bspc desktop $current -n $shift 
bspc desktop t -n $current


