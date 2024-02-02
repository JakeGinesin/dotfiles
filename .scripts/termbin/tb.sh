#!/bin/bash
file=$1
cat "$1" | nc termbin.com 9999 
