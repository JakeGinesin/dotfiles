#!/bin/bash

if mtp-detect | grep -q "Galaxy"; then
  sudo mkdir /home/synchronous/AndroidPhone
  sudo jmtpfs /home/synchronous/AndroidPhone
else
  echo "Phone not plugged in"
fi
