#!/bin/bash
#CS 370
#Frank Senseney
#5/19/2018

#Check if args are numbers
numreg='^[0-9]+$'
if [[ ! $1 =~ $numreg || ! $2 =~ $numreg ]]; then
   echo "Error: Parameters must be numbers"
   exit 1
fi

#Check if the number of args is correct 
if [ ! $# -eq 2 ]; then
   echo "Usage: $0 <number of users to list> <number of seconds for recent log>"
   exit 1
fi

#Check if args are positive
if [ $1 -le 0 ] || [ $2 -le 0 ]; then
   echo "Error: Parameters must be positive"
   exit 1
fi

#Clean up old files
if [ -f activeUsers.log ]; then
    rm activeUsers.log
fi
if [ -f Recent.log ]; then
    rm Recent.log
fi
if [ -f Total.log ]; then
    rm Total.log
fi

while :; do
   startTime=$(date +%s)
   while [ $(($(date +%s) - startTime)) -le 60 ]; do
   currentTime=$(($(date +%s) - startTime))
   echo -ne "$currentTime\033[0K\r"
   #Every 10 seconds update activeUsers.log
   if [ ! $currentTime -eq 0 ] && [ $(($currentTime % 10)) -eq 0 ]; then
      ps -eo user:$(cut -d: -f1 /etc/passwd | wc -L) | sort | uniq -c | sort -rn > activeUsers.log
      echo 'activeUsers.log was updated'
   fi
   #Every 60 seconds print out everything
   if [ ! $currentTime -eq 0 ] && [ $(($currentTime % 60)) -eq 0 ]; then
      echo "Users with the most processes in the last $2 seconds:"
      cat Recent.log | sort | uniq -c | sort -k2 | head -$1
      echo "Users with the most processes since the start of the script:"
      cat Total.log | sort | uniq -c | sort -k2 | head -$1
   fi
   #Every <n> seconds clear the recent log file
   if [ ! $currentTime -eq 0 ] && [ $(($currentTime % $((60 - $2)))) -eq 0 ]; then
      if [ -f Recent.log ]; then
         rm Recent.log
      fi
   fi
   ps -eo user:$(cut -d: -f1 /etc/passwd | wc -L),group --no-header >> Recent.log
   ps -eo user:$(cut -d: -f1 /etc/passwd | wc -L),group --no-header >> Total.log
   sleep 1
   done
done
