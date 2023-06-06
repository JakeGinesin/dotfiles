#!/bin/bash
# this script is designed to select a note to open via rofi

rs="$(find /home/synchronous/documents/Obsidian/Journal/abstract -follow -printf "%T@ %Tc %p\n" | sort -n -r | cut -c102- | grep -E '.md$' | grep -v 'template')"
rcv=$(echo "$rs" | rofi -dmenu)
if [[ "$rcv" == "" ]]; then exit 1; fi
if [[ $(echo "$rs" | grep "$rcv") ]]; then
  alacritty -t "$rcv" -e nvim /home/synchronous/documents/Obsidian/Journal/abstract/$rcv -c "Goyo | syntax match LinkPattern /[a-zA-Z0-9][a-zA-Z0-9]*\.md/ | highlight LinkPattern guifg=LightBlue gui=underline | nnoremap <CR> :call CustomGf()<CR> | nnoremap gf :call CustomGf()<CR> | set path+=/home/synchronous/Documents/Obsidian/Journal/abstract"
else
  # create a new file
  
  # if rcv doesn't contain md, add it
  if [[ $(echo "$rcv" | grep -v -E ".md$") ]]; then 
    rcv="$rcv.md"
  fi
  alacritty -t "$rcv" -e nvim /home/synchronous/documents/Obsidian/Journal/abstract/$rcv -c "Goyo | syntax match LinkPattern /[a-zA-Z0-9][a-zA-Z0-9]*\.md/ | highlight LinkPattern guifg=LightBlue gui=underline | nnoremap <CR> :call CustomGf()<CR> | nnoremap gf :call CustomGf()<CR> | set path+=/home/synchronous/Documents/Obsidian/Journal/abstract"
fi
