# its372
Course materials and demos for labs

## Lab02: Windows commands - Storage management

**1.Description**

Practice storage management in Windows commands:
1. Create/initialize/partition/format virtual disk
2. Create/copy/explore folders and files

**2.Steps**

1. (40%) Create/initialize/partition/format virtual disk in diskpart
   1. (10%) Create/attach one 1GB virtual disk
   2. (10%) Create two partitions on this virtual disk, each of 512MB
   3. (10%)Format one partition as FAT32, the other one as NTFS
   4. (10%) Assign drive letter X to FAT32 partition, Y to NTFS.
2. (40%) Create/copy/explore folders and files
   1. (10%) On partition X, create a folder hierarchy of subfolders and files to record cases of digital forensics. A top folder Hawaii contains four subfolders: Hawaii, Honolulu, Kalawao, Kauai and Maui.
   2. (10%) Create a set of empty files under the folders: create a readme.txt under the top Hawaii; hcase1.txt to hcase9.txt under subfolder Hawaii; hocase1.txt to hocase5.txt under Honolulu; kcase11.txt to kcase16.txt under Kalawao; kaucase23.txt to kaucase28.txt under Kauai; mcase02.dat to mcase07.dat under Maui
   3. (10%) Change the extension of dat to txt under Maui
   4. (10%)Copy all folders and files from partition X to partition Y, except these files: hcase5.txt, kcase13.txt and mcase04.txt

**3.Review questions** 

Use copy, xcopy, and robocopy to construct command lines to achieve the following goals. Show your command lines work as expected.
   1. (4%) Show you a message before copying each file
   2. (4%) Update destination files, i.e. only copy files newer from the source to destination
   3. (4%) Copy a folder and all its subfolders, no matter a subfolder is empty or not
   4. (4%) Copy only hidden files
   5. (4%) Prompt to confirm that you want to overwrite an existing destination file


**Demo video**

* [Storage Management In Windows Command](https://youtu.be/NgeK-W4Boy4)

## References
* [diskpart](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/diskpart)
  * [How to Use DiskPart Utility in Windows?](https://helpdeskgeek.com/how-to/diskpart-windows-how-to-use/)
  * [Volume_(computing)](https://en.wikipedia.org/wiki/Volume_(computing))
    * [Volume vs. Partition – What’s the Difference?](https://www.techjunkie.com/volume-vs-partition/)
  * [Convert an MBR disk into a GPT disk](https://docs.microsoft.com/en-us/windows-server/storage/disk-management/change-an-mbr-disk-into-a-gpt-disk)
  * [vdisk attached permanently](https://social.technet.microsoft.com/Forums/windows/en-US/3f3d1a5f-9371-4a44-8daa-22c06d2e1c03/vdisk-attached-permanently?forum=w7itproinstall)
* [Windows commands](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)
  * [attrib](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/attrib)
  * [copy](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/copy)
  * [robocopy](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy)
  * [xcopy document](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/xcopy)
  * [mkdir](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mkdir)
  * [for](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/for)

