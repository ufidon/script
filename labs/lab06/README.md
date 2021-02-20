# its372
Course materials and demos for labs

## Lab06: Powershell programming - Modular programming

### 1. Description
On Windows networks and computers, users, groups and computers can be managed with both net.exe or Powershell cmdlets or mixed both. In this lab, we are going to generalize and modularize various functionalities of the previous lab.

### 2. Tasks (70%)
1. (35%, each 5%) Manage Windows users and groups with Powershell
   1. view all local users
   2. view a specified user with its name
   3. create a local user (3%) and check it is created (2%)
   4. delete a local user (3%) and check it is deleted (2%)
   5. check a local user is disabled (1%), then enable a local user (3%) and check it is enabled (1%)
   6. check a local user is enabled (1%), then disable a local user (3%) and check it is disabled (1%)
   7. check a local user's description (1%), then change the description to a different one (3%) and check it is changed (1%)
2. (35%, each TODO 5%) Complete the TODOs in the template [funframe.ps1](./code/funframe.ps1)
   1. (20%) Rewrite all net user commands with Powershell cmdlets
   2. TODO 1: delete the user with name $uname
      1. (2%) implementation code
      2. (1%) check the user EXISTS
      3. (1%) delete the user
      4. (1%) check it is deleted
   3. TODO 2: modify the description of the user with name $uname
      1. (2%) implementation code
      2. (1%) check the user's description
      3. (1%) change its description to a different one
      4. (1%) check its description is changed
   4. TODO 3: set the user named $uname able to change her password
      1. (2%) implementation code
      2. (1%) check the user cannot change its password
      3. (1%) set the user named $uname able to change her password
      4. (1%) check the user named $uname able to change her password

### 3. Review questions (30%)
1. Create a Powershell script to resize all images in a folder and its subfolder to an uniform size.
   1. (5%) Create a Powershell script for creating folder structure like this and download some sample image from [openclipart.org](https://openclipart.org/), the extension may be any image extension, not necessary jpg.
   >animals 
   >
   >> Mammalia
   >>> - elephant.jpg
   >>> - dog.jpg
   >
   >> Amphibia
   >>> - frog.jpg
   >>> - lizard.jpg
   >
   >> Insecta
   >>> - dragonfly.jpg
   2. (5%) Download and install [imagemagick](https://imagemagick.org/), add it to the PATH environment variable so it can be called from anywhere on the computer (do this in the Powershell script).
   3. (15%) Compose a Powershell script to resize all images above to an uniform size, name them as filename-widthxheight.jpg.
   4. (5%) Test the script works as expected, all images are converted to the expected size

**Demo video**



## References
* [Microsoft.PowerShell.LocalAccounts](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts)
* [About Comment-based Help](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?)
* [Network: Change Adapter Options - Windows cannot access the specified device, path or file After installed AD DS](https://social.technet.microsoft.com/Forums/en-US/3e4d3515-8e27-40a3-a37a-d571a3554f2b/network-change-adapter-options-windows-cannot-access-the-specified-device-path-or-file?forum=winserverManagement)
* [How to use net for user management?](https://www.lifewire.com/net-user-command-2618097)
  * [net user](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc771865(v=ws.11))
  * [What is krbtgt](https://www.kjctech.net/do-you-need-to-update-krbtgt-account-password/)
* [Active Directory](https://docs.microsoft.com/en-us/powershell/module/addsadministration)
  * [set-aduser](https://docs.microsoft.com/en-us/powershell/module/addsadministration/set-aduser)
* [How to check a path exists?](https://stackoverflow.com/questions/31888580/a-better-way-to-check-if-a-path-exists-or-not-in-powershell/31896279)
* Check a local user exists: (net user $username) -ne $null
* [Powershell: How can I stop errors from being displayed in a script?](https://stackoverflow.com/questions/8388650/powershell-how-can-i-stop-errors-from-being-displayed-in-a-script)
* [Execution of external commands in PowerShell done right](https://mnaoumov.wordpress.com/2015/01/11/execution-of-external-commands-in-powershell-done-right/)
* [imagemagick](https://imagemagick.org/)
  * [How to convert a SVG to a PNG with ImageMagick?](https://stackoverflow.com/questions/9853325/how-to-convert-a-svg-to-a-png-with-imagemagick)
  * [commandline tools](https://imagemagick.org/script/command-line-tools.php)
    * [Anatomy of the Command-line](https://imagemagick.org/script/command-line-processing.php)
* [unoconv](https://github.com/unoconv/unoconv)
* [Sending PowerShell Results to PDF (Part 1)](https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/sending-powershell-results-to-pdf-part-1)
* [Sending PowerShell Results to PDF (Part 2)](https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/sending-powershell-results-to-pdf-part-2)