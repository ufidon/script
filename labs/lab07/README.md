# its372
Course materials and demos for labs

## Lab07: Bash programming - Monolithic programming

### 1. Description
On Linux system, users and groups can be managed conveniently and efficiently with relative commands such as:
* user{add,del,mod}, {add,del}user, newusers
* group{add,del,mod,mems}, {add,del}group

### 2. Tasks (65%)
1. (30%, each 5%) Manage Linux users and groups with commands
    1. Create three groups: Republican, Democratic and Libertarian
    2. Create three normal users in each group:

       | group | chair | members |
       | ----- | ----- | ------- |
       | Republican | Nixon | Bush, Trump |
       | Democratic | Clinton | Obama, Hilary |
       | Libertarian | Gary | William, Alan |

    3. Add the chairs to the sudo group
    4. Create three folders under /opt directory for each group, make sure each folder is exclusively accessible by all the corresponding group members. The three folders are named after the group names respectively
    5. Each folder is owned by the chair from the respective group
2. (35%, each TODO 5%) Complete the 7 TODOs in the template [usermanager.sh](./code/usermanager.sh). For each TODO, complete and demonstrate:
   1. (2%) implementation code
   2. (1%) check the prerequisites satisfy running the code
   3. (1%) run the code
   4. (1%) check the expected result is gotten

### 3. Review questions (30%, 5% for each)
1. Practice text processing with suitable commands on the text file [gvmreport.txt](./code/gvmreport.txt)
   1. Find the number of lines, words, chars and bytes of gvmreport.txt
   2. Show the following contents of gvmreport.txt
      1. first 3 lines, 
      2. last 7 lines, 
      3. all but the last 100 lines
   3. Find all different IP addresses and print them out
   4. Find the total number of issues
   5. Extract line 53-66, save them as PortSummary.txt
   6. Replace all section title "Issue" with "Problem", leave other issue occurrences intact


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




