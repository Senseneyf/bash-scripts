#Frank Senseney
#cs370 lab 2 part 2
#4/22/18

#list all connected users
who

#list the last 7 users that logged in yesterday before 2pm
last | grep -E "$(date -d 'yesterday' '+%b %d')" | awk '$7<14' | head -7

#print the short hostname of the current machine
hostname -s

#Ping nix1 3 times
ping -c 3 nix1.cs.cwu.edu

#Clear the screen
clear

#Print the ip addresses of cwu.edu and google.com
#nslookup, dig, etc. dont work on nix1, szilard is aware
dig +short cwu.edu
dig +short google.com

#get system date 
date

#get how long the system has been running
uptime
