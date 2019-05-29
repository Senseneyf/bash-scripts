#!/bin/bash
#CS 370
#Frank Senseney
#5/20/2018

#Check if the number of args is correct
if [ ! $# -eq 1 ]; then
   echo "Usage: $0 <directory>"
   exit 1
fi

#Check if the input dir exists
if [ ! -d $1 ]; then
   echo "Error: directory '$1' doesn't exist"
   exit 1
fi

find $1 -type f -exec ls -ltR {} + | awk '{print $9, $6, $7, $8}' > creationTime.txt
find $1 -mindepth 1 -type d -exec du -h {} + | sort -rn > subdirSize.txt
echo "creationTime.txt"
cat creationTime.txt
echo "subdirSize.txt"
cat subdirSize.txt
