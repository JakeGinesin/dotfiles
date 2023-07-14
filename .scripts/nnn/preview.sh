#!/usr/bin/env sh
# #############################################################################
# File: preview_cmd.sh
# Description: Minimal example to preview files and directories
#              No external dependencies
#              Can be easily extended
#              Automatically exits when the NNN_FIFO closes
#              Prints a `tree` if directory or `head` if it's a file
#
# Shell: POSIX compliant
# Author: Todd Yamakawa
#
# ToDo:
#   1. Add support for more types of files
#         e.g. binary files, we shouldn't try to `head` those
# #############################################################################

# Check FIFO
NNN_FIFO=${NNN_FIFO:-$1}
if [ ! -r "$NNN_FIFO" ]; then
    echo "Unable to open \$NNN_FIFO='$NNN_FIFO'" | less
    exit 2
fi

# Read selection from $NNN_FIFO
while read -r selection; do
    clear
    lines=$(($(tput lines)-1))
    cols=$(tput cols)

    # Print directory tree
    if [ -d "$selection" ]; then
        cd "$selection" || continue
        tree | head -n $lines | cut -c 1-"$cols"
        continue
    fi

    # Print file head
    if [ -f "$selection" ]; then
        head -n $lines "$selection" | cut -c 1-"$cols"
        continue
    fi

    # Something went wrong
    echo "Unknown type: '$selection'"
done < "$NNN_FIFO"
