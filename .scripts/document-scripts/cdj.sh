#!/bin/bash

if [[ "$1" =~ ^[0-9][0-9]$ ]]; then
  dirs=$(find /home/synchronous/documents -maxdepth 2 -type d)
  for item in $dirs
  do
    if [[ "$item" =~ \/$1-[^0-9] ]]; then
      echo $item
      exit 0
    fi
  done
fi

if [[ "$1" =~ [0-9][0-9]\.[0-9][0-9] ]]; then 
  dirs=$(find /home/synchronous/documents -maxdepth 3 -type d)
  for item in $dirs
  do
    if [[ "$item" =~ \/$1-[^0-9] ]]; then
      echo $item
      exit 0
    fi
  done
fi

echo "$1 doesn't exist"


