#!/bin/bash

echo "---------- PREAMBLE BEGIN ----------"

# removing previously compiled files
rm -r */*/*.class

# advanced:
# find all java files and output the names to sources.txt
find -name "*.java" > sources.txt

# compile all!
javac @sources.txt

# get compiled files and now output to sources.txt
find -name "*.class" > sources.txt

# create jar
jar cvfm Program.jar manifest.txt @sources.txt

# get contents of jar
jar tf Program.jar

# run jar
java -jar Program.jar

echo "---------- PREAMBLE END ----------"

printf "\n"

echo "---------- JUNIT TESTING BEGIN ----------"

java org.junit.runner.JUnitCore $1
echo "---------- JUNIT TESTING END ----------"
