#!/usr/bin/env bash
state="$(qdbus org.gnome.Pomodoro /org/gnome/Pomodoro org.freedesktop.DBus.Properties.Get org.gnome.Pomodoro State)"
if [ "$state" == "null" ]; then
  echo ""
  exit 1
fi

elapsed=$(qdbus org.gnome.Pomodoro /org/gnome/Pomodoro org.freedesktop.DBus.Properties.Get org.gnome.Pomodoro Elapsed)
state_duration=$(qdbus org.gnome.Pomodoro /org/gnome/Pomodoro org.freedesktop.DBus.Properties.Get org.gnome.Pomodoro StateDuration)

remaining=$(echo "$state_duration - $elapsed" | bc)

# Format the remaining time as minutes:seconds
minutes=$(echo "$remaining / 60" | bc)
seconds=$(echo "$remaining % 60" | bc)

# Pad seconds with leading zero if necessary
printf -v seconds "%02d" $seconds 2> /dev/null

if [ "$state" == "short-break" ]; then
  state="break"
fi

echo "$state - $minutes:$seconds"


