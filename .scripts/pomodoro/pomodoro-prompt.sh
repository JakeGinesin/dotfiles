#!/usr/bin/env bash

# Get the timestamp
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Ask for the session goal
session_goal=$(echo "" | rofi -dmenu -theme /home/synchronous/.config/rofi/styles/prompt2.rasi -p "session goal:")

# Write the timestamp and the session goal to the track file in the desired format
echo "[$timestamp] - $session_goal" > /home/synchronous/.scripts/pomodoro/track.txt

# Append a line break to the track file
echo "" >> /home/synchronous/.scripts/pomodoro/track.txt
