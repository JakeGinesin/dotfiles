#!/bin/bash
# a script designed to get the classes in the current semester

for d in `ls /home/synchronous/current-semester/` ; do
  cat /home/synchronous/current-semester/$d/info.yaml | yq -r .name | perl -p -e "chomp if eof" && echo ": " | perl -p -e "chomp if eof" 
  cat /home/synchronous/current-semester/$d/info.yaml | yq .url
done
