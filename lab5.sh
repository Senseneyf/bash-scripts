#!/bin/bash
#Lab 5
#CS 370
#Frank Senseney
#5/31/2018

#words=/usr/share/dict/words

#Function to print usage and error info
usage(){
   if [ $# -eq 2 ]; then
      echo "Error: '$2' is not a valid file or path"
   elif [ $# -eq 1 ]; then
      echo "Usage: $1 <Input file> <Dictionary file> <Numer of results to print>"
      exit 1
   fi
}

#Check if number of parameters specified is within range
if [ ! $# -eq 3 ]; then
   usage $0
   exit 1
elif [ $3 -le 0 ]; then
   echo "Error: the <Number of results> parameter must be positive"
   exit 1
#Check if parameters are valid files
elif [ ! -f $1 ]; then
   usage $0 $1
   exit 1
elif [ ! -f $2 ]; then
   usage $0 $2
   exit 1
fi

echo "The $3 most common typos found in '$1'"
cat $1 | xargs -n1 | sed "/[[:punct:]]*/{ s/[^[:alnum:][:space:]\'-]//g}" | grep -xivFf $2 | sort | uniq -c | sort -rn | head -$3