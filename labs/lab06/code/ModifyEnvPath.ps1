[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -path $_})]
    [string]
    $exePath,
    [switch]
    $addPath
)

<# TODO:
If $addPath = $true, at $exePath to the environment variable PATH
Else remove it if its is inside PATH

Refs:
1. https://docs.microsoft.com/en-us/dotnet/api/system.environment.getenvironmentvariables
2. https://www.sapien.com/blog/2014/11/18/removing-objects-from-arrays-in-powershell/
3. https://stackoverflow.com/questions/1391853/removing-duplicate-values-from-a-powershell-array
#>

$path = [System.Environment]::GetEnvironmentVariable('path', [System.EnvironmentVariableTarget]::Machine)
[System.Collections.ArrayList]$pathArray = $path -split ";"


if ($addPath){
    # add $exePath to PATH
    if ($pathArray.Contains($exePath)){
        Write-Host -Object "$exePath is already in the system environmental variable PATH.`n"
        exit(1)
    }
    else {
        $pathArray += $exePath
        $path = $pathArray -join ";"
        [System.Environment]::SetEnvironmentVariable('path', $path, [System.EnvironmentVariableTarget]::Machine)
    }    
}else{
    # remove $exePath from PATH
    if(-not $pathArray.Contains($exePath)){
        Write-Host -Object "$exePath is NOT in the system environmental variable PATH.`n"
        exit(2)
    }
    else{
        $pathArray.Remove($exePath)
        $path = $pathArray -join ";"
        [System.Environment]::SetEnvironmentVariable('path', $path, [System.EnvironmentVariableTarget]::Machine)
    }
}

# check result
Write-Host -Object "$exePath is added to the system environmental variable PATH.`n"
Write-Host -Object "Look:"
$path = [System.Environment]::GetEnvironmentVariable('path', [System.EnvironmentVariableTarget]::Machine)
Write-Host -Object $path

exit(0)