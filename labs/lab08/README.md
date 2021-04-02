# its372
Course materials and demos for labs

## Lab08: Bash programming - Modular programming

### 1. Description
On Linux system, users and groups can be managed conveniently and efficiently with relative commands such as:
* user{add,del,mod}, {add,del}user, newusers
* group{add,del,mod,mems}, {add,del}group

In this lab, practice modular programming in bash by abstracting groups of commands into functions.

### 2. Tasks
1. (50%) Write a bash script to implement the following functionalities
   1. (10%)Find the users who have the longest user name
   2. (20%)Find the groups who have the largest number of users
   3. (20%)Find the users who are in the largest number of groups

2. (50%, each 10%) Complete the 5 TODOs in the template [userfun.sh](./code/userfun.sh). For each TODO, complete and demonstrate:
   1. (4%) implementation code
   2. (2%) check the prerequisites satisfy running the code
   3. (2%) run the code
   4. (2%) check the code works as expected

### 3. Review questions (Optional)

1. Investigate the the bash scripts of [sdkman-cli](https://github.com/sdkman/sdkman-cli).


**Demo video**


## References
* [User Management](https://ubuntu.com/server/docs/security-users)
  * [Ubuntu User Management](https://linuxhint.com/ubuntu-user-management/)
  * [How to Manage Users and Groups on Ubuntu Linux](https://zach-gollwitzer.medium.com/how-to-manage-users-and-groups-on-ubuntu-linux-e036f4503107)
* *Linux text processing commands*
  * [GNU sed manual](https://www.gnu.org/software/sed/manual/sed.html)
    * [How to Use the sed Command on Linux](https://www.howtogeek.com/666395/how-to-use-the-sed-command-on-linux/)
    * [sed](https://www.computerhope.com/unix/used.htm)
      * [Extract all ip addresses with sed and awk from a string](https://stackoverflow.com/questions/48604723/extract-all-ip-addresses-with-sed-and-awk-from-a-string)
  * [awk](https://en.wikipedia.org/wiki/AWK)
    * [gawk manual](https://www.gnu.org/software/gawk/manual/gawk.html)
  * [ed](https://en.wikipedia.org/wiki/Ed_(text_editor))
  * [How to Use Regular Expressions (regexes) on Linux](https://www.howtogeek.com/661101/how-to-use-regular-expressions-regexes-on-linux/)
* [Sending Email Using mailx/s-nail in Linux Through Gmail SMTP](https://www.systutorials.com/sending-email-from-mailx-command-in-linux-using-gmails-smtp/)
* [sdkman-cli](https://github.com/sdkman/sdkman-cli)
* [nvm](https://github.com/nvm-sh/nvm)
