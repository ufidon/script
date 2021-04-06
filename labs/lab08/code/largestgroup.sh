#!/usr/bin/env bash

# Find the groups who have the largest number of users
# check: /etc/group

# round 1: find the number of members of the largest group
((maxg=0))
((i=0))
while IFS= read -r line
do
    IFS=',' read -r -a array <<< "$line"
    if [[ maxg -lt ${#array[@]} ]]
    then
        maxg=${#array[@]}
        #groupname[$i]=$line
    fi
    #printf "%s: %d\n" $line ${#array[@]}
done < <(getent group | cut -d ':' -f4)

echo "The number of members of the largest groups is: " $maxg

# round 2: find all those groups with the largest number of users
((i=0))
while IFS= read -r line
do
    IFS=',' read -r -a array <<<  $(echo $line | cut -d ':' -f2)
    if [[ maxg -eq ${#array[@]} ]]
    then
        groupname[$i]=$(echo $line | cut -d ':' -f1)
        members[$i]=$(echo $line | cut -d ':' -f2)
        #printf "%s: %d\n" $groupname[$i] ${#array[@]}
    fi    
done < <(getent group | cut -d ':' -f1,4)

for (( i=0; i<${#groupname[@]}; i++ ))
do
    echo -e "The groups who have the largest number of users: \n" ${groupname[$i]}
    echo "It has users: " ${members[$i]}
done