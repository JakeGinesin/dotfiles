#!/bin/bash
shift="$1"
current=$(bspc query -D -d --names)
#echo "$(($current + 1))"
if [[ "$shift" == "left" ]]; then 
  iter=$(expr $current - 1)
  if [[ "$iter" == 0 ]]; then 
    iter="20"
  fi 
  while [[ "$iter" != "$current" ]]
  do
    if [[ "$(bspc query -N -d $iter)" != "" ]]; then
      bspc desktop -f "$iter"
      exit 0
    fi
    iter=$(expr $iter - 1)
    if [[ "$iter" == 0 ]]; then 
      iter="20"
    fi 
  done

elif [[ "$shift" == "right" ]]; then
  iter=$(expr $current + 1)
  if [[ "$iter" == 21 ]]; then 
    iter="1"
  fi 
  while [[ "$iter" != "$current" ]]
  do
    if [[ "$(bspc query -N -d $iter)" != "" ]]; then
      bspc desktop -f "$iter"
      exit 0
    fi
    iter=$(expr $iter + 1)
    if [[ "$iter" == 21 ]]; then 
      iter="1"
    fi 
  done
else
  echo "incorrect arguments. sorry!"
fi
