#!/usr/bin/env bash

# if cmus or spotify isn't running, this exit will trigger
er="$(cmus-remote -Q 2> /dev/null)"
eq="$(playerctl --player=spotify status 2> /dev/null)"
if [ "$er" == "" ] && [ "$eq" == "" ] ;then 
  exit 1
fi 

#sspot="$()"
#if [[ "$eq" == "Paused" ]];then  

if [[ "$eq" != "No players found" ]]; then
  stitle="$(playerctl --player=spotify metadata --format "{{ title }}" )"
  sartist="$(playerctl --player=spotify metadata --format "{{ artist }}")"

  if [ ${#sartist} -gt 13 ]; then
    sartist="${sartist:0:$((13))}.."
  fi

  if [ ${#stitle} -gt 20 ]; then 
    stitle="${stitle:0:$((20))}.."
  fi

  soutput="$sartist - $stitle"
  rb=""
  if [[ "$eq" == "Paused" ]]; then
    rb="| ";
  elif [[ "$eq" == "Playing" ]]; then
    rb="> ";
  fi
  soutput="${rb}${soutput}"
  echo "$soutput"
elif [[ "$er" != "" ]]; then
  # if cmus isn't currently playing a song, this will trigger
  artist="$(cmus-remote -Q 2> /dev/null |  awk -F"tag artist " '{print $2}' | tr -d '\n')"
  if [[ "$artist" == "false" ]] ;then 
    exit 1
  fi

  title="$( cmus-remote -Q 2> /dev/null |  awk -F"tag title " '{print $2}' | tr -d '\n')"

  if [ ${#artist} -gt 13 ]; then
    artist="${artist:0:$((13))}.."
  fi

  if [ ${#title} -gt 20 ]; then 
    title="${title:0:$((20))}.."
  fi

  ss="$(cmus-remote -Q 2> /dev/null| awk -F/ NR==1'{print $NF}'|awk -F. '{print $1}')"

  output="$artist - $title"
  scroll_length=30

  # if not playing
  if [[ "$ss" != "status playing" ]]; then
    # to be completed..
    r="| "
    output="${r}${output}"
  # if is playing
  else 
    r="> "
    output="${r}${output}"
  fi

  echo "$output"
fi

echo ""

