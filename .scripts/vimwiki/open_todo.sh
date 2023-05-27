#!/bin/bash
alacritty -t "Todo.md" -e nvim /home/synchronous/Documents/Obsidian/Journal/Todo.md -c "nnoremap <CR> :call CustomGf()<CR> | nnoremap gf :call CustomGf()<CR> | syntax match LinkPattern /[a-zA-Z0-9][a-zA-Z0-9]*\.md/ | highlight LinkPattern guifg=LightBlue gui=underline | set path+=/home/synchronous/Documents/Obsidian/Journal/abstract | Goyo"
