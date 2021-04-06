#!/usr/bin/env bash

# Find the users who are in the largest number of groups
# check: /etc/passwd
# and command id

# round 1: find the number of members of the largest group
((maxg=0))
((i=0))
while IFS= read -r line
do
    ng=$(id -nG $line | wc -w)
    if [[ maxg -lt $ng ]]
    then
        maxg=$ng
        #username[$i]=$line
    fi
    #printf "%s: %d\n" $line $ng
done < <(cat /etc/passwd | cut -d ':' -f1)

echo "The number of groups of the most sociable users is: " $maxg

# round 2: find all those groups with the largest number of users
((i=0))
while IFS= read -r line
do
    ng=$(id -nG $line | wc -w)
    if [[ maxg -eq $ng ]]
    then
        username[$i]=$line
        groups[$i]=$(id -nG $line)
        #printf "%s: %s\n" $username[$i] ${groups[@]}
    fi    
done < <(cat /etc/passwd | cut -d ':' -f1)

for (( i=0; i<${#username[@]}; i++ ))
do
    echo -e "The most sociable users: \n" ${username[$i]}
    echo "It is in these groups: " ${groups[$i]}
done