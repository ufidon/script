[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -path $_})]
    [string]
    $imageLinks,
    [string]
    $destinationFolder,
    [switch]
    $createDestinationFolder,
    [switch]
    $sameFolder 
)
<#
TODO:
if $sameFolder is $true, save all images under the $destinationFolder
else save each image under the folder specified in the $imageLinks file
#>

if (-not (Test-Path -Path $destinationFolder)) {
    if($createDestinationFolder)
    {
        New-Item -Path $destinationFolder -ItemType Directory
    }
    else{
        $destinationFolder = Get-Location
    }    
}

Get-Content -path $imageLinks | ForEach-Object { 
    $line = $_ -split ','; 
    $subfolder = $destinationFolder + "\" + $line[2];

    if(-not (Test-Path -Path $subfolder))
    {
        New-Item -Path $subfolder -ItemType Directory
    }
    $file = $subfolder + "\" + $line[1] + ".jpg";  

    Invoke-WebRequest -Uri $line[0] -OutFile $file 
} 
