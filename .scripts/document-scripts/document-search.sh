#!/bin/bash

doc_dir="/home/synchronous/documents"

OIFS="$IFS"
IFS=$'\n'

filesall=""
files=$(find $doc_dir -name "*.pdf")
for file in $files
do
  prefix=$(echo "$file" | grep -o -E '[0-9][0-9]\.[0-9][0-9]')
  echo $file
  name=$(echo "$file" | awk -F/ '{print $NF}')
  # name=$(echo "$file" | grep -oP '^\/\S*\/\K\S+(?=\.pdf)')
  entry="[${prefix}]  ${name}"
  # https://unix.stackexchange.com/questions/20035/how-to-add-newlines-into-variables-in-bash-script
  filesall=${filesall}${entry}'
'
done
filesall=$(echo "$filesall" | grep -v '^$')
# echo "$filesall"

selected_file=$(echo "$filesall" | rofi -dmenu -i -p "Select a paper" -theme /home/synchronous/.config/rofi/styles/prompt-papers.rasi)
# echo "$selected_file"

if [ -n "$selected_file" ]; then
  selected_file=$(echo "$selected_file" | cut -c10-)
  echo "$selected_file"
  full_path=$(find $doc_dir -name "$selected_file")

  # Open the selected file with zathura
  zathura "$full_path"
fi
