#!/bin/bash
# this script is invoked to launch my main daily note
# https://jakegines.in/blog/2023/one

# yeah yeah I need to replace this with a function in init.vim but i am lazy
# I also really need to better organize my neovim config lmao but idc
alacritty -t "Daily.md" -e nvim /home/synchronous/journal/Daily.md -c "execute 'normal G' | nnoremap gf :call CustomGf()<CR> | syntax match LinkPattern /[a-zA-Z0-9][a-zA-Z0-9]*\.md/ | highlight LinkPattern guifg=LightBlue gui=underline | set path+=/home/synchronous/journal/abstract | Goyo"
