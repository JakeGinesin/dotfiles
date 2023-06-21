#!/bin/bash

paper_dir="/home/synchronous/documents/10-19-papers"
OIFS="$IFS"
IFS=$'\n'

paperall=""
papers=$(find $paper_dir -name "*.pdf")
for file in $papers
do
  prefix=$(echo "$file" | grep -o -E "[0-9][0-9]\.[0-9][0-9]")
  name=$(echo "$file" | awk -F/ '{print $NF}')
  entry="[${prefix}]  ${name}"
  # https://unix.stackexchange.com/questions/20035/how-to-add-newlines-into-variables-in-bash-script
  paperall=${paperall}${entry}'
'
done
paperall=$(echo "$paperall" | grep -v '^$')

selected_file=$(echo "$paperall" | rofi -dmenu -i -p "Select a paper" -theme /home/synchronous/.config/rofi/styles/prompt-papers.rasi)
echo "$selected_file"

if [ -n "$selected_file" ]; then
  selected_file=$(echo "$selected_file" | cut -c10-)
  echo "$selected_file"
  full_path=$(find $paper_dir -name "$selected_file")

  # Open the selected file with zathura
  zathura "$full_path"
fi
