#!/bin/bash

cr=$(pwd)

# Check if a file name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

# Execute the conditional command
if grep -Fxq "$(pwd)" /home/synchronous/.scripts/zathura/excluded; then
    zathura --fork "$cr/$1" -c /dev/null
else
    zathura --fork "$cr/$1" 
fi
