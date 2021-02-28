param (
    [string]$SrcFolder = "C:\Users\Administrator\Documents\its372\lab06\animals",
    [int]$NewWidth = 512,
    [int]$NewHeight = 512,
    [string]$DstFolder = $null,
    [switch]$CreateDst = $false
)

<# TODO:
If DstFolder is provided, exists or can be created,
    save all converted images to it
Else
    save all converted images alongside their source images
#>

if(-not (test-path -Path $SrcFolder))
{
    Write-Host "Source folder NOT exists!"
    exit 1
}

if($DstFolder -ne "")
{
    # destination folder not exists
    if (-not (Test-Path -Path $DstFolder)) {
        if(-not $CreateDst){
            Write-Host "Destination folder NOT exists!"
            exit 2
        } else {
            New-Item -Path $DstFolder -ItemType Directory
        }
    }
}

# change the ImageMagick path to yours
$env:Path = $env:Path + ";C:\Program Files\ImageMagick-7.0.11-Q16"


Get-ChildItem -Path $SrcFolder -Recurse -File | ForEach-Object {
    # ref: https://imagemagick.org/script/command-line-processing.php
    $newsize = $NewWidth.ToString() + "x" + $NewHeight.ToString() + "!"
    $iimg = $_

    # new_image_name = older_image_name-widthxheight.jpg
    if($DstFolder -ne ""){
        $oimg = $DstFolder + "\" +$_.BaseName + "-" + $NewWidth.ToString() + "x" + $NewHeight.ToString() +".jpg"
    }else{
        $oimg = $_.Directory.ToString() +"\" +$_.BaseName + "-" + $NewWidth.ToString() + "x" + $NewHeight.ToString() +".jpg"
    }

    # If deprecated pixel format used, converion fails
    # make sure the source image range is set correctly
    # ref: https://imagemagick.org/script/command-line-processing.php
    $msg = "Converting: " + $iimg + " --> " + $oimg
    Out-Host -InputObject $msg
    magick convert -resize $newsize   "$iimg"  "$oimg"  
    
    # ref: https://trac.ffmpeg.org/wiki/Scaling
    # $newsize = $NewWidth.ToString() + ":" + $NewHeight.ToString()
    # ffmpeg.exe -i $iimg -vf scale=$newsize $oimg
}
