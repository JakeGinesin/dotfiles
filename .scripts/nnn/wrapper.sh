#!/bin/bash
echo "pog" > /home/synchrnous/gg
# Check if $1 starts with the path "/home/synchronous/journal/"
if [[ $1 == /home/synchronous/journal/* ]]; then
  nohup alacritty -e nvim "$1" -c "Goyo | syntax match LinkPattern /[a-zA-Z0-9][a-zA-Z0-9]*\.md/ | highlight LinkPattern guifg=LightBlue gui=underline | nnoremap <CR> :call CustomGf()<CR> | nnoremap gf :call CustomGf()<CR> | set path+=/home/synchronous/journal/abstract" > /dev/null &
else
  nohup alacritty -e nvim "$1" > /dev/null &
fi

