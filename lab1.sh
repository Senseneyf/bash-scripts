#!/bin/sh
#Frank Senseney
#4/10/2018
#370 lab 1

mkdir -p lab1/dir1/{dir2/dir3,dir4/dir5}

rmdir lab1/dir1/dir4/dir5

cd /var/log
cd ~

pwd

ls
ls -a ~
ls -ltr ~

cat > lab1/file1.txt
cat > lab1/file2.txt
cat lab1/file1.txt lab1/file2.txt > lab1/contant.txt
cat lab1/contant.txt

more -p /etc/passwd

cp lab1/dir1/dir2 lab1/dir1/dir4
cp -v lab1/dir1/dir2 lab1/dir1/dir4

mv lab1/file1.txt lab1/file2.txt ~
mv lab1/contant.txt lab1/dir1/dir2/blabla.txt

#the contant file was alrady removed by mv
#rm lab1/contant.txt
rm lab1/dir1/dir2/blabla.txt
rm -rfi lab1/dir1/dir2/*

rename -v 's/\.(c|cpp)$/.c++/' *

w
w -h

last
last -n 3 manager

date
date +%D
date +'%m/%d'
date +'%T %Z'

#create a file so we have something to sort
#cat > lab1/blabla.txt
sort lab1/blabla.txt
sort -r lab1/blabla.txt
sort lab1/blabla.txt | uniq -u
sort -rn -k 3 point.txt

head -n 10 blabla.txt
head -c 20 blabla.txt
head -n -2 blabla.txt

tail -n 20 blabla.txt
tail -n 5 /etc/passwd
tail -c 10 blabla.txt

ln -s /etc/passwd password_info

chmod +x blabla.sh
chmod g-rw blabla.sh

du -a
du -ab
du -ak
du -am

df -a
df -ah