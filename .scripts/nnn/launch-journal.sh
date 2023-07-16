#!/usr/bin/env sh
nohup alacritty -e sh -c 'export PATH=/home/synchronous/.scripts/nnn:$PATH; export VISUAL=wrapper.sh; export EDITOR="$VISUAL"; export NNN_PLUG="m:preview-tui;"; export NNN_FIFO=/tmp/nnn.fifo; export NNN_TERMINAL=alacritty; nnn -e /home/synchronous/journal' >/dev/null 2>&1 &
