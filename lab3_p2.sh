#!/bin/bash
#Lab 3 script 2
#Cs 370
#Frank Senseney
#5/8/2018

#If the user doesn't provided the required arguments print the usage guidelines
if [ `echo $1 | awk '{print length}'` -eq 0 ] || [ `echo $2 | awk '{print length}'` -eq 0 ]; then
   echo "Usage: $0 <directory> <pattern>"
   exit 1
fi

#Check if the specified directory exists
if [ ! -d $1  ]; then
   "That directory doesn't exit"
   exit 1
fi

#Find all files in the directory that match the pattern and sort them in decending order by word count
echo "Files in '$1' matching the pattern '$2' in  decending order by word count:"
find $1 -maxdepth 1 -type f | xargs wc -w | sort -rn | grep -e $2
