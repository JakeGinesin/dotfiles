#!/bin/bash

MOUNT_POINT="/home/synchronous/android_phone"
fusermount -u $MOUNT_POINT
rm -rf $MOUNT_POINT
