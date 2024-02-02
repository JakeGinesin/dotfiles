#!/bin/bash
#
if mtp-detect | grep -q "Galaxy"; then
  fusermount -u /home/synchronous/AndroidPhone
  rm -rf /home/synchronous/AndroidPhone
else 
  echo "Phone not plugged in"
fi
