#!/bin/bash
paper_dir="/home/synchronous/papers"
papers=$(find /home/synchronous/papers -name "*.pdf" -exec basename {} \;)
selected_file=$(echo "$papers" | rofi -dmenu -i -p "Select a paper" -theme /home/synchronous/.config/rofi/styles/prompt-papers.rasi)

if [ -n "$selected_file" ]; then
  full_path="$paper_dir/$selected_file"
  echo "$full_path"

  okular "$full_path"
fi
