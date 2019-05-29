#!/bin/bash
#Lab 3 script 1
#Cs 370
#Frank Senseney
#5/3/2018

#If the user doesn't provided the required arguments print the usage guidelines
if [ `echo $1 | awk '{print length}'` -eq 0 ] || [ `echo $2 | awk '{print length}'` -eq 0 ]; then
   echo "Usage: $0 <directory> <number of results>"
   exit 1
fi

#Check if the directory exists and find files and subdirectories in that directory the current user has permissions to read/write
if [ ! -d $1  ]; then
   "'$1' doesn't exist"
   exit 1
fi

#Print the first n lines of the files that the current user has read/write access to in the provided directory and its subdirectories
for f in $(find $1 -user $USER -perm -u+wr); do
   if [ -f $f ]; then
      echo ">> $f"
      head -$2 $f
      echo " "
   fi
done
