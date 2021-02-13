# its372
Course materials and demos for labs

## Lab05: Powershell programming- Windows user management I

### 1. Description
On Windows networks and computers, users, groups and computers can be managed with both net.exe or Powershell cmdlets or mixed both.

### 2. Tasks (70%)
1. (35%, each 5%) Manage Windows users and groups with net.exe
   1. view all local users
   2. view a specified user with its name
   3. create a local user
   4. delete a local user
   5. enable a local user
   6. disable a local user
   7. change the home folder of a local user
2. (35%, each TODO 5%) Complete the TODOs in the template [psuserman.ps1](code/psuserman.ps1)

### 3. Review questions (30%)
1. Create a Powershell script to resize all images in a folder and its subfolder to an uniform size.
   1. (5%) Create a folder structure like this and download some sample image from [openclipart.org](https://openclipart.org/), the extension may be any image extension, not necessary jpg.
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
   2. (5%) Download and install [imagemagick](https://imagemagick.org/), add it to the PATH environment variable so it can be called from anywhere on the computer.
   3. (15%) Compose a Powershell script to resize all images above to an uniform size, name as filename-widthxheight.ext, the extension ext is as the original.
   4. (5%) Test the script works as expected

## References
* [About Comment-based Help](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?)
* [Network: Change Adapter Options - Windows cannot access the specified device, path or file After installed AD DS](https://social.technet.microsoft.com/Forums/en-US/3e4d3515-8e27-40a3-a37a-d571a3554f2b/network-change-adapter-options-windows-cannot-access-the-specified-device-path-or-file?forum=winserverManagement)
* [How to use net for user management?](https://www.lifewire.com/net-user-command-2618097)
  * [net user](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc771865(v=ws.11))
  * [What is krbtgt](https://www.kjctech.net/do-you-need-to-update-krbtgt-account-password/)
* [How to check a path exists?](https://stackoverflow.com/questions/31888580/a-better-way-to-check-if-a-path-exists-or-not-in-powershell/31896279)
* Check a local user exists: (net user $username) -ne $null
* [Powershell: How can I stop errors from being displayed in a script?](https://stackoverflow.com/questions/8388650/powershell-how-can-i-stop-errors-from-being-displayed-in-a-script)
* [Execution of external commands in PowerShell done right](https://mnaoumov.wordpress.com/2015/01/11/execution-of-external-commands-in-powershell-done-right/)
* [imagemagick](https://imagemagick.org/)
* [unoconv](https://github.com/unoconv/unoconv)
* [Sending PowerShell Results to PDF (Part 1)](https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/sending-powershell-results-to-pdf-part-1)
* [Sending PowerShell Results to PDF (Part 2)](https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/sending-powershell-results-to-pdf-part-2)
