# its372
online materials for its372



## Module01: Windows batch programming
### Windows commands
* act on command interpreter
  * cls - Clears the screen
  * echo - Displays messages, or turns command echoing on or off
  * color - Sets the console foreground and background colors
  * graftabl - Enables the display of an extended character set in graphics mode
  * title - Changes the window title
  * prompt - Sets or modifies the string displayed when waiting for input
  * break - Sets or clears extended CTRL+C checking
  * pause - Causes the command session to pause for user input
  * exit - Quits the CMD.EXE program (command interpreter)
  * cmd - Invokes another instance of Microsoft's CMD
  * help - Shows command help


* act on system information & configuration
  * act on text encoding, locale
    * chcp - (change code page) Displays or sets the active code page number.
  * act on date/time
    * date - Displays and sets the system date
    * time - Displays or sets the system clock
  * environmental variables
    * path - Sets or modifies the PATH environment
    * set - Sets or displays shell environment variables
    * setx - Sets or displays system environment variables

  * operating system, drivers, registry
    * ver - Shows the command processor, operating system versions
    * systeminfo - Shows configuration of a computer and its operating system
    * bcdedit - Edits Boot Configuration Data (BCD) files
    * driverquery - Shows all installed device drivers and their properties
    * mode - A multi-purpose command to display device status, configure ports and devices, and more
    * reg - Queries or modifies Windows registry
    * wmic - Starts Windows Management Instrumentation Command-line (WMIC)
    
 
 
* act on disks, partitions, volumes
  * vol - Shows the label of the current volume
  * label - Adds, sets or removes a disk label
  * chkdsk - Checks disks for disk problems, listing them and repairing them if wished
  * chkntfs - Shows or sets whether system checking should be run when the computer is started
  * cipher - Shows the encryption state, encrypts or decrypts folders on a NTFS volume
  * convert - Converts a volume from FAT16 or FAT32 file system to NTFS file system
  * diskcomp - Compares the content of two floppies
  * diskcopy - Copies the content of one floppy to another
  * diskpart - Shows and configures the properties of disk partitions
  * format - Formats a disk to use Windows-supported file system such as FAT, FAT32 or NTFS
  * fsutil - A powerful tool performing actions related to FAT and NTFS file systems
  * recover - Recovers as much information as it can from damaged files on a defective disk

* act on files and directories
  * files
    * attrib - Displays or sets file attributes
    * assoc - Associates an extension with a file type (FTYPE).
    * copy, xcopy, robocopy - Copies files and folders
    * verify - Verifies that file copy has been done correctly
    * move - Moves a file to a new location
    * replace - Replaces files in the destination folder with same-named files in the source folder
    * del, erase - Deletes one or more files
    * ren, rename - Renames a file or directory
    * type - Prints the content of a file to the console
    * more - Displays the contents of a file or files, one screen at a time
    * comp, fc - Compares files
    * compact - Shows or changes the compression of files or folders on NTFS partitions
    * where - Outputs one or more locations of a file or a file name pattern
    * makecab, expand - create, extracts files from compressed .cab cabinet files
    * find - Searches for a string in files or input, outputting matching lines
    * findstr - Searches for regular expressions or text strings in files
    * sort - Sorts alphabetically, from A to Z or Z to A, case insensitive.
    * openfiles - Performs actions pertaining to open files, especially those opened by other users over the network

  * folders
    * dir - Displays a list of files and subdirectories in a directory
    * tree - Displays a tree of all subdirectories of the current directory to any level of recursion or depth
    * cd, chdir - Displays or sets the current directory.
    * md, mkdir - Creates a directory
    * rd, rmdir - Removes the directory
    * ren, rename - Renames a file or directory
    * subst - Assigns a drive letter to a local folder, displays current assignments, or removes an assignment
    * pushd - Pushes the current directory onto the stack, and changes to the new directory 
    * popd - Changes to the drive and directory popped from the directory stack
    * compact - Shows or changes the compression of files or folders on NTFS partitions

* act on users
  * net user
  * calcs, icalcs - Shows or changes discretionary access control lists (DACLs)
  * gpresult - Displays group policy settings and more for a user or a computer 


* act on networks
  * arp - Displays or changes items in the address resolution protocol cache, which maps IP addresses to physical addresses
  * ipconfig - Displays Windows IP Configuration
  * ping - Send ICMP/IP "echo" packets over the network to the designated address (or the first IP address that the designated hostname maps to via name lookup) and print all responses received
  * net - Provides various network services, depending on the command used


* act on processes, services
  * start - Starts a program with various options
  * at - Schedules a program to be run at a certain time
  * schtasks - Schedules a program to be run at a certain time, more powerful than AT
  * sc - Controls Windows services, supporting starting, stopping, querying and more
  * shutdown - Shuts down a computer, or logs off the current user
  * tasklist - Lists tasks, including task name and process id (PID)
  * taskkill - Ends one or more tasks


* batch scripting
  * rem - A comment command. Unlike double-colon (::), the command can be executed
  * call - Calls one batch program from another
  * shift - Moves the batch parameters forward
  * if, else - conditional branch
  * goto - Goes to a label, unconditional branch
  * forfiles - Finds files by their modification date and file name pattern, and executes a command for each found file
  * setlocal, endlocal - Creates a child environment for the batch file
  * choice - Lets the user choose one of multiple options by pressing a single key, and sets the error level as per the chosen option
  * timeout - Waits a specified number of seconds, displaying the number of remaining seconds as time passes
  * clip - Places the piped input to the clipboard
  * doskey - creates macros as alternatives to very short batch scripts
  * rundll32 - Runs a function available from a DLL


### Batch scripting
* _Tutorials_
  * [Windows batch scripting](https://en.wikibooks.org/wiki/Windows\_Batch\_Scripting)

* _Questions_
  * [What is the difference between ++i and i++?](https://stackoverflow.com/questions/24853/c-what-is-the-difference-between-i-and-i)
  * [ Does cmd.exe execute the old version or updated version when the source code is modified during execution?](https://en.wikibooks.org/wiki/Windows\_Batch\_Scripting\#Batch\_reloading)

### Windows scripting

* [Windows Script Host overview](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc738350\(v=ws\.10\)?redirectedfrom=MSDN)
* [Windows Script Host](https://docs.microsoft.com/en-us/previous-versions//9bbdkx3k\(v=vs\.85\)?redirectedfrom=MSDN)
* [Reference (Windows Script Host)](https://docs.microsoft.com/en-us/previous-versions//98591fh7\(v=vs.85\)?redirectedfrom=MSDN)
* [Active Scripting](https://en.wikipedia.org/wiki/Active\_Scripting)
* [wscript](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/wscript)
* [cscript](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cscript)
* [VBScript](https://docs.microsoft.com/en-us/previous-versions/t0aew7h6\(v=vs\.85\))
* [JScript](https://docs.microsoft.com/en-us/previous-versions//hbxc2t98\(v=vs.85\)?redirectedfrom=MSDN)
* [Visual Studio Tools for Applications](https://en.wikipedia.org/wiki/Visual\_Studio\_Tools\_for\_Applications)

## Tips
* [Managing user accounts from windows command line](https://www.windows-commandline.com/category/user-accounts/)
* [Create and Manage User Accounts and Privileges in Windows 10](https://www.groovypost.com/howto/create-manage-user-account-privileges-windows-10/)

## Windows system documentation

* [Windows Commands](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)
* [Command-Line Reference](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc754340%28v%3dws.11%29)
* [Windows batch scripting](https://en.wikibooks.org/wiki/Windows\_Batch\_Scripting)

# Tools
* [ConEmu](https://conemu.github.io/)


