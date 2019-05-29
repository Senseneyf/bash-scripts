#!/bin/bash
#Lab 3 script 3
#Cs 370
#Frank Senseney
#5/8/2018

#If the user doesn't provided the required arguments print the usage guidelines
if [ `echo $1 | awk '{print length}'` -eq 0 ]; then
   echo "Usage: $0 <path to file>"
   exit 1
fi

#Check if the file exists
if [ ! -f $1  ]; then
   "'$1' doesn't exist"
   exit 1
fi

#Make a directory to store the dictionary files
mkdir "$1_dictionary"
#For each word in the specified file, append it to the end of correct text file
tr -s '[:blank:]' '[\n*]' < $1 |
  while IFS= read -r word; do
     case $word in
        [aA]*) echo $word >> "$1_dictionary"/a.txt ;;
        [bB]*) echo $word >> "$1_dictionary"/b.txt ;;
        [cC]*) echo $word >> "$1_dictionary"/c.txt ;;
        [dD]*) echo $word >> "$1_dictionary"/d.txt ;;
        [eE]*) echo $word >> "$1_dictionary"/e.txt ;;
        [fF]*) echo $word >> "$1_dictionary"/f.txt ;;
        [gG]*) echo $word >> "$1_dictionary"/g.txt ;;
        [hH]*) echo $word >> "$1_dictionary"/h.txt ;;
        [iI]*) echo $word >> "$1_dictionary"/i.txt ;;
        [jJ]*) echo $word >> "$1_dictionary"/j.txt ;;
        [kK]*) echo $word >> "$1_dictionary"/k.txt ;;
        [lL]*) echo $word >> "$1_dictionary"/l.txt ;;
        [mM]*) echo $word >> "$1_dictionary"/m.txt ;;
        [nN]*) echo $word >> "$1_dictionary"/n.txt ;;
        [oO]*) echo $word >> "$1_dictionary"/o.txt ;;
        [pP]*) echo $word >> "$1_dictionary"/p.txt ;;
        [qQ]*) echo $word >> "$1_dictionary"/q.txt ;;
        [rR]*) echo $word >> "$1_dictionary"/r.txt ;;
        [sS]*) echo $word >> "$1_dictionary"/s.txt ;;
        [tT]*) echo $word >> "$1_dictionary"/t.txt ;;
        [uU]*) echo $word >> "$1_dictionary"/u.txt ;;
        [vV]*) echo $word >> "$1_dictionary"/v.txt ;;
        [wW]*) echo $word >> "$1_dictionary"/w.txt ;;
        [xX]*) echo $word >> "$1_dictionary"/x.txt ;;
        [yY]*) echo $word >> "$1_dictionary"/y.txt ;;
        [zZ]*) echo $word >> "$1_dictionary"/z.txt ;;
     esac
  done

#Sort the resulting dictionary files
for f in $(find "$1_dictionary"); do
   if [ -f $f ]; then
      sort $f > $f
   fi
done
