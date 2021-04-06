#!/usr/bin/env bash

# find the users with the longest user name
# check: /etc/passwd

# round 1: find the length of the longest user name
((maxun=0))
((i=0))
while IFS= read -r line
do
    if [[ maxun -lt ${#line} ]]
    then
        maxun=${#line}
        #usrname[$i]=$line
    fi
    #printf "%s: %d\n" $line ${#line}
done < <(cut -d ':' -f1 /etc/passwd)

echo "The longest username length is: " $maxun

# round 2: find all those users with the longest user name
((i=0))
while IFS= read -r line
do
    if [[ maxun -eq ${#line} ]]
    then
        usrname[$i]=$line
        #printf "%s: %d\n" $line ${#line}
    fi    
done < <(cut -d ':' -f1 /etc/passwd)

echo -e "The users who have the longest user name: \n" ${usrname[@]}