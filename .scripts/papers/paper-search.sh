#!/bin/bash
paper_dir="/home/synchronous/zotero/storage"
papers=$(find $paper_dir -name "*.pdf" -exec basename {} \;)
selected_file=$(echo "$papers" | rofi -dmenu -i -p "Select a paper" -theme /home/synchronous/.config/rofi/styles/prompt-papers.rasi)

if [ -n "$selected_file" ]; then
  full_path=$(find $paper_dir -name "$selected_file")
  echo "$full_path"

  zathura --fork "$full_path"
fi
