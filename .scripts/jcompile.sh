#!/bin/bash

echo "---------- PREAMBLE BEGIN ----------"

# remove current manifest
rm manifest.txt

# add another manifest based on user's input
echo "Main-Class: ${1}" > manifest.txt

# removing previously compiled files
find . -name "*.class" -type f -delete

# advanced:
# find all java files and output the names to sources.txt
find -name "*.java" > sources.txt

echo "---------- PREAMBLE END ----------"

printf "\n"

echo "---------- COMPILATION BEGIN ----------"

# compile all!
javac @sources.txt

echo "---------- COMPILATION END ----------"
