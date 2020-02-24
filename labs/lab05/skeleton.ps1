<# A Powershell Script Program for Local User Management 
.Description
Local user management
.LINK
1. How to use net for user management?
https://www.lifewire.com/net-user-command-2618097
2. How to check a path exists?
https://stackoverflow.com/questions/31888580/a-better-way-to-check-if-a-path-exists-or-not-in-powershell/31896279
3. Check a local user exists
(net user $username) -ne $null
#>


# show how to use this script
Out-Host -InputObject "This is A Powershell Script Program for Local User Management`n"
Out-Host -InputObject "Usage:"
Out-Host -InputObject "?: shows this usage"
Out-Host -InputObject "c: create a user"
Out-Host -InputObject "r: remove a user"
Out-Host -InputObject "l: list all users"
Out-Host -InputObject "v: view a user's profile"
Out-Host -InputObject "a: activate a user"
Out-Host -InputObject "d: disable a user"
Out-Host -InputObject "m: modify user's information"
Out-Host -InputObject "q: quit the program"

$helpmsg = "Usage:`n" +
           "?: shows this usage`n" +
           "c: create a user`n" +
           "r: remove a user`n" +
           "l: list all users`n" +
           "v: view a user's profile`n" +
           "a: activate a user`n" +
           "d: disable a user`n" +
           "m: modify user's information`n" +
           "q: quit the program`n"

while($true)
{
    $input = Read-Host "`n`nEnter a letter"
    switch($input)
    {
        "?" {
            Out-Host -InputObject $helpmsg
            break
        }
        "c" {
            break
        }
        "l" {
            net user
            break
        }
        "q" {
            #Exit-PSSession, not working
            exit
        }
        default{
            Out-Host -InputObject "Unsupported letter command"
            break;
        }
    }
}