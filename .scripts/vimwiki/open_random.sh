#!/bin/bash

DIR="/home/synchronous/journal/abstract/"
FILES=(${DIR}*.md)

# Check if there are .md files in the directory
if [ ${#FILES[@]} -eq 0 ]; then
    echo "Error: No .md files found in the directory"
    exit 1
fi

RANDOM_FILE=${FILES[RANDOM % ${#FILES[@]}]}
FILENAME=$(basename "$RANDOM_FILE")

alacritty -t "$rcv" -e nvim $RANDOM_FILE -c "Goyo | syntax match LinkPattern /[a-zA-Z0-9][a-zA-Z0-9]*\.md/ | highlight LinkPattern guifg=LightBlue gui=underline | nnoremap <CR> :call CustomGf()<CR> | nnoremap gf :call CustomGf()<CR> | set path+=/home/synchronous/journal/abstract"
