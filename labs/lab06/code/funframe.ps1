<# 
.SYNOPSIS
A Powershell Script Program for Local User Management 
.Description
This is A Powershell Script Program for Local User Management.
Usage: In the file explorer, right click the script then run it as Administrator
?: shows this usage
c: create a user
r: remove a user
l: list all users
v: view a user's profile
a: activate a user
d: disable a user
m: modify user's information
q: quit the program
.Example
Enter a letter: r
-------------------------------------------------------------
Enter the User's name you want to remove: ptest
user ptest not exists


Enter a letter: v
-------------------------------------------------------------
Enter the User's name you want to view her profile: ptest
user ptest not exists
.LINK
1. How to use net for user management?
https://www.lifewire.com/net-user-command-2618097
2. How to check a path exists?
https://stackoverflow.com/questions/31888580/a-better-way-to-check-if-a-path-exists-or-not-in-powershell/31896279
3. Check a local user exists
(net user $UserName) -ne $null
4. Powershell: How can I stop errors from being displayed in a script?
https://stackoverflow.com/questions/8388650/powershell-how-can-i-stop-errors-from-being-displayed-in-a-script
5. Microsoft.PowerShell.LocalAccounts
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts
#>

# suppress the error messages
$ErrorActionPreference= 'silentlycontinue'

############### PUT ALL FUNCTIONS BEFORE THE MAIN FUNCTION ###############################
# show how to use this script
function Show-Help {
    Out-Host -InputObject "This is A Powershell Script Program for Local User Management`n"
    Show-Help2
}

function Show-Help2 {
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

    Out-Host -InputObject $helpmsg
}

function  Get-Letter {
    $letter = Read-Host "`n`nEnter a letter"
    $letter
}

function Test-UserExistence {
    param (
        $UserName
    )

    if((net user $UserName 2>$null) -eq $null)
    {
        Out-Host -InputObject "user $UserName not exists" 
        $false
    } else {
        Out-Host -InputObject "user $UserName  exists"
        $true
    }    
}

function Get-UserName ( $CommandLetter )
{ 
    $uname = ""
    switch ($CommandLetter) {
        "c" {  
            $uname = Read-Host "Enter the User's name you want to create"
            break;
        }
        "r" {
            $uname = Read-Host "Enter the User's name you want to remove"
            break;
        }
        "v" {
            $uname = Read-Host "Enter the User's name you want to view her profile"
            break;
        }
        "a" {
            $uname = Read-Host "Enter the User's name you want to activate"
            break;
        }
        "d" {
            $uname = Read-Host "Enter the User's name you want to disable"
            break;
        }
        "m" {
            $uname = Read-Host "Enter the User's name you want to modify her information"
            break;
        }
        Default {
            Out-Host -InputObject "Unsupported letter command"
            break
        }
    }
   $uname
}

function Get-UserInfo {
    param (
        $Aspect
    )
    Out-Host -inputobject "Hint: No change just press enter."
    $info = ""
    switch ($Aspect) {
        "Password" { 
            $info = Read-host "Enter the User's password"
            break
         }
        "Fullname"{
            $info = Read-Host "Enter the User's full name"
            break
        }
        "HomeDirectory"{
            $info = Read-Host "Enter the User's home directory"
            break;
        }
        "UserDescription" {
            $info = Read-Host "Enter the User's description"
            break
        }
        "PasswordChangeable"{
            $info = Read-Host "Can the user change her password?[yes|no]"
            break
        }
        Default {
            Out-Host -InputObject "Unknown aspect"
            break
        }
    }
    $info
}

function Is-EmptyString {
    param (
        $String
    )

    if ($String -eq "") {
        $true
    }else{
        $false
    }    
}

function Is-PathExist {
    param (
        $Path
    )
    if (Test-Path -Path $path) {
        Out-Host -InputObject "$path  exist!"
        $true
    }else{
        Out-Host -InputObject "$path  not exist!"
        $false
    }
}


function View-User {
    param (
        $UserName
    )

    net user $UserName
}

function List-AllUsers {
    net user
}

function Create-User {
    param (
        $UserName,
        $Password
    )
    net user $UserName $Password /add
}


# TODO 1: Implement the function Delete-User 
function Delete-User {

}

function Activate-User {
    param (
        $UserName,
        [switch] $Active
    )

    if ($Active) {
        net user $UserName /active:yes
    }
    else {
        net user $UserName /active:no
    }      
}

function Change-UserFullname {
    param (
        $UserName,
        $Fullname
    )
    net user $UserName /fullname:$Fullname
}


# TODO 2: Implement the function Change-UserDescription
function Change-UserDescription {

}

 
function Change-UserHomeDirectory {
    param (
        $UserName,
        $HomeDirectory
    )
    net user $UserName /homedir:$HomeDirectory
}


# TODO 3: Implement the function Allow-UserChangePassword
# -Changeable is a switch!
function Allow-UserChangePassword {

}


# the main program logic of user management
:mainfunction
while($true)
{
    $inputletter = Get-Letter
    switch($inputletter)
    {
        "?" {
            Show-Help
            break
        }
        "c" {
            $uname = Get-UserName -CommandLetter "c"
            if(Test-UserExistence -UserName $uname){
                break
            }
            $passwd = Get-UserInfo -Aspect "Password"
			
            Create-User -UserName $uname -Password $passwd
			
            break
        }
        "r" {
            $uname = Get-UserName -CommandLetter "r"
            if(-not (Test-UserExistence -UserName $uname)){
                break
            }
			
			# TODO 1': Implement the function Delete-User to delete the user with name $uname
            Delete-User -UserName $uname
			
            break
        }
        "v" {
            $uname = Get-UserName -CommandLetter "v"
            if(-not (Test-UserExistence -UserName $uname)){
                break
            }
            
            View-User -UserName $uname

            break
        }
        "l" {
            List-AllUsers
            break
        }
        "a" {
            $uname = Get-UserName -CommandLetter "a"
            if(-not(Test-UserExistence -UserName $uname) ){
                break
            }
            # -Active is a switch parameter
            Activate-User -UserName $uname -Active
            
            break
        }
        "d" {
            $uname = Get-UserName -CommandLetter "d"
            if(-not(Test-UserExistence -UserName $uname) ){
                break
            }
			
            Activate-User -UserName $uname
            break
        }
        "m" {
            $uname = Get-UserName -CommandLetter "m"
            if(-not(Test-UserExistence -UserName $uname) ){
                break;
            }
            
            $fname = Get-UserInfo -Aspect "Fullname"
            if(-not(Is-EmptyString -String $fname) ){
                Change-UserFullname -UserName $uname -Fullname $fname
            }
            $homepath = Get-UserInfo -Aspect "HomeDirectory"
            if(Is-PathExist -Path $homepath){			
                Change-UserHomeDirectory -UserName $uname -HomeDirectory $homepath
            }

            $description = Get-UserInfo -Aspect "UserDescription"
            if(-not(Is-EmptyString -String $description) ){
                # TODO 2': Implement the function Change-UserDescription to
                # change the description of the user named $uname 
                Change-UserDescription -UserName $uname -UserDescription $description
            }
            $passchg = Get-UserInfo -Aspect "PasswordChangeable"
            if($passchg -match "[y]")
            {
                # TODO 3': Implement the function Allow-UserChangePassword to 
                # set the user named $uname able to change her password
                # -Changeable is a switch
                Allow-UserChangePassword -UserName $uname -Changeable
            }
            else{
                Allow-UserChangePassword -UserName $uname -Changeable:$false
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







