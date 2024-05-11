#!/bin/bash

MOUNT_POINT="/home/synchronous/android_phone"

# Check if mount point exists, if not, create it
if [ ! -d "$MOUNT_POINT" ]; then
  mkdir -p "$MOUNT_POINT"
fi

simple-mtpfs $MOUNT_POINT

if mountpoint -q "$MOUNT_POINT"; then
  echo "Mount was successful."
else
  echo ""
  echo "Accept the phone prompt!"
  sleep 5
  simple-mtpfs $MOUNT_POINT
fi
