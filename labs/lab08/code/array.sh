#!/usr/bin/env bash

# refs:
# 1. https://www.cyberciti.biz/faq/unix-howto-read-line-by-line-from-file/
# 2. https://tldp.org/LDP/abs/html/io-redirection.html

# 1. How to Read a File Line By Line in Bash

filename="./test.txt"
printf "\n1. read %s line by line:\n" $filename
(( lno = 0 ))
while IFS= read -r line
do
    (( lno++ ))
    echo "$lno: $line" 
done < "$filename"

# 2. How to read the output from command/process substitution 
#  line by line
echo -e "\n2. read the output from command/process substitution line by line"
((fno=0))
while IFS= read -r line
do
    ((++fno))
    printf "%d: %s\n" $fno $line
done < <(ls)

# 3. Read here string line by line
echo -e "\n3. Read here string line by line\n"
((ln=0))
while IFS= read -r line
do
    ((ln++))
    echo "$ln: $line"
    # awk is difficult to handle this, using Perl
    #awk -F ' +' '{printf("PID:%d, Term:%s, Time:%t, $Prog:%s\n",$1,$2,$3,$4)}' <<<$line
done <<< $(ps -aux)

# 4. Read line by line from file descriptor
#
filename="./test.txt"
printf "\n4. read %s line by line:\n" $filename
(( lno = 0 ))
while IFS= read -r -u33 line
do
    (( lno++ ))
    echo "$lno: $line" 
done 33< "$filename"

# 5. Read/write file in bash
#
echo -e "\n5. Read/write file in bash"
echo 2198612809 > phoneno
exec 7<> phoneno
IFS= read -r phno <&7
echo -n "(${phno:0:3})${phno:3:3}-${phno:6}" >&7
exec 7>&-
cat phoneno

# 6. Read fields
#
fname="/etc/passwd"
echo -e "\n6. Read fields"
((uno=0))
((maxg=0))
msu=$(whoami)
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
    ((uno++))
    numgroups=$(id -nG $f1 | wc -w)
    #((maxg = maxg < numgroups ? numgroups : maxg))
    if [[ maxg -lt numgroups ]]
    then
        maxg=$numgroups
        msu=$f1
    fi
    printf "%d: %s in %d groups\n" $uno $f1 $numgroups
done <"$fname"
echo "$msu: $maxg"