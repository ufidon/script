# its372
Course materials and demos for labs

## Lab03: Batch programming - Find information about files

### 1. Description
In this lab, write a small batch program showing file information.
The program should be well-commented. It has the following functions:

1. program name and usage
   * program name is fileinfo
   * Usage: 
   * fileinfo filename
   * fileinfo /? show this help
2. exception handling
   1. if no parameter is provided, show the usage and exit
   2. if /? is provided, show the usage and exit
   3. if more than one parameter provided, show the usage and exit
   4. if one parameter is provided, but the file not exist show the problem and exit
3. the file exists, show the choice table and input hint
----------------------------------------
Please select what information you want:
1. Full pathname press f
2. Drive latter press d
3. Drive-less path press p
4. File name only press n
5. File name extension press x
6. File attributes press a
7. File modification date and time press t
8. File size press z
9. Quit press q
----------------------------------------
Please press the corresponding key to select the information: [F,D,P,N,X,A,T,Z,Q]?
****************************************

### 2. Steps(70%)
Work on the [framework batch program](./code/fileinfo.bat) to complete the tasks below.

1. (25%, 5% each) Implement functions 4-8 below, other functions are implemented as references
2. (45%, 5% each) Demonstrate each function works

### 3. Review questions(30%)
1. (10%) Install and run [openstego](https://github.com/syvaidya/openstego), solve related problems if any to make the execution successful. Hints: 
   1. (5%) Analyze its batch program used to load its main program implemented in Java.
   2. (5%) Use [Zulu JDK 11](https://www.azul.com/downloads/zulu-community/?package=jdk) for the JRE/JDK.
2. (10% )Create a [simple batch program](./code/backup.bat) to backup Windows events about security, and test it works
3. (10%) Use [schtasks](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/schtasks) to 
   1. (4%) create a task named MyDailyRoutine that runs the simple batch program daily (set it runs every minute for testing purpose)
   2. (3%) verify the scheduled task is triggered as expected
   3. (3%) delete the scheduled task

**Demo video**

* [Windows batch programming](https://youtu.be/OvgA7kgGXnM)

### References
* [Windows Batch Scripting](https://en.wikibooks.org/wiki/Windows_Batch_Scripting)
* [Windows service](https://en.wikipedia.org/wiki/Windows_service)
  * [Service Control Manager](https://en.wikipedia.org/wiki/Service_Control_Manager)
  * [Writing Windows Services in PowerShell](https://docs.microsoft.com/en-us/archive/msdn-magazine/2016/may/windows-powershell-writing-windows-services-in-powershell)
  * [Svchost.exe](https://en.wikipedia.org/wiki/Svchost.exe)
* [schtasks](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/schtasks)