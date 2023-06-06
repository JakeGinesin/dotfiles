#!/bin/bash
rr="$(vdirsyncer sync 2> /tmp/khalsync || cat /tmp/khalsync | grep -E 'error')"
if [[ "$rr" == "" ]]; then
  khal calendar 
else
  read -p "A vdirsyncher synch error occured. Get khal anyway? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
  khal calendar 
fi
rm /tmp/khalsync
