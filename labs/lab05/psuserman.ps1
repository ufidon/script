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
4. Powershell: How can I stop errors from being displayed in a script?
https://stackoverflow.com/questions/8388650/powershell-how-can-i-stop-errors-from-being-displayed-in-a-script
#>

# suppress the error messages
$ErrorActionPreference= 'silentlycontinue'

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
            $uname = Read-Host "Enter the User's name you want to create"
            if((net user $uname 2>$null) -ne $null){
                Out-Host -InputObject "user $uname exists"
                break
            }
            $passwd = Read-host "Set the User's password"
			
			# TODO: create a local user with name $uname and password $passwd
            
			
            break
        }
        "r" {
            $uname = Read-Host "Enter the User's name you want to remove"
            if((net user $uname 2>$null) -eq $null){
                Out-Host -InputObject "user $uname not exists"
                break
            }
			
			# TODO: delete the user with name $uname
            
			
            break
        }
        "v" {
            $uname = Read-Host "Enter the User's name you want to view her profile"
            if((net user $uname 2>$null) -eq $null){
                Out-Host -InputObject "user $uname not exists"
                break
            }
			
            net user $uname

            break
        }
        "l" {
            net user
            break
        }
        "a" {
            $uname = Read-Host "Enter the User's name you want to activate"
            if((net user $uname 2>$null) -eq $null){
                Out-Host -InputObject "user $uname not exists"
                break
            }
			# TODO: activate user with name $uname
            
            
            break
        }
        "d" {
            $uname = Read-Host "Enter the User's name you want to activate"
            if((net user $uname  2>$null) -eq $null){
                Out-Host -InputObject "user $uname not exists"
                break
            }
			
            # TODO: enable user with name $uname
            
            break
        }
        "m" {
            $uname = Read-Host "Enter the User's name you want to modify her information"
            if((net user $uname 2>$null) -eq $null){
                Out-Host -InputObject "user $uname not exists"
                break;
            }
            Out-Host -inputobject "Hint: No change just press enter."
            $fname = Read-Host "User's full name"
            if($fname -ne ""){
				# TODO: modify the fullname of the user with name $uname 
                
            }
            $homepath = Read-Host "User's home directory"
            if(Test-Path $homepath){
				# TODO: modify the home directory of the user with name $uname 				
                
            }
            else
            {
                Out-Host -InputObject "$homepath  not exist!"
            }
            $description = Read-Host "User's description"
            if($description -ne ""){
                net user $uname /comment:$description
            }
            $passchg = Read-Host "Can the user change her password?[yes|no]"
            if($passchg -match "[y]")
            {
				# TODO: set the user named $uname able to change her password
                
            }
            else{
                net user $uname /passwordchg:no
            }
            break;
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