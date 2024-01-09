#!/bin/bash

if [[ $(bluetoothctl devices) == "No default controller available" ]]; then
  echo "click the bluetooth button lol"
  exit 1
fi

# if we are not connected to gb, try to connect
if bluetoothctl info | grep -q "Missing device address argument"; then
  bluetoothctl connect F8:8F:07:E1:FA:A7 > /dev/null
  exit 1
fi

echo "already connected to:"
bluetoothctl info | grep "Name" | cut -d ' ' -f 2-
  
  
