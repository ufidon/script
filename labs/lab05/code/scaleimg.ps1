param ( # DON'T USE THIS FOR LAB05
    [string]$SrcFolder = "C:\Users\Administrator\Documents\its372\lab05\animals",
    [int]$NewWidth = 512,
    [int]$NewHeight = 512,
    [string]$DstFolder = $null,
    [switch]$CreateDst = $false
)

if(-not (test-path -Path $SrcFolder))
{
    Write-Host "Source folder NOT exists!"
    exit 1
}

if($DstFolder -ne "")
{
    if (-not (Test-Path -Path $DstFolder)) {
        if(-not $CreateDst){
            Write-Host "Destination folder NOT exists!"
            exit 2
        } else {
            New-Item -Path $DstFolder -ItemType Directory
        }
    }
}

# change the path to yours
$env:Path = $env:Path + ";C:\Program Files\ImageMagick-7.0.11-Q16"

# change the path to yours
$imgdir = $SrcFolder
$width = $NewWidth
$height = $NewHeight

Get-ChildItem -Path $imgdir -Recurse -File | ForEach-Object {
    # ref: https://imagemagick.org/script/command-line-processing.php
    $newsize = $width.ToString() + "x" + $height.ToString() + "!"
    $iimg = $_

    # new_image_name = older_image_name-widthxheight.jpg
    if($DstFolder -ne ""){
        $oimg = $DstFolder + "\" +$_.BaseName + "-" + $width.ToString() + "x" + $height.ToString() +".jpg"
    }else{
        $oimg = $_.Directory.ToString() +"\" +$_.BaseName + "-" + $width.ToString() + "x" + $height.ToString() +".jpg"
    }

    # If deprecated pixel format used, converion fails
    # make sure the source image range is set correctly
    # ref: https://imagemagick.org/script/command-line-processing.php
    # magick convert -resize $newsize   "$iimg"  "$oimg"  
    # ref: https://trac.ffmpeg.org/wiki/Scaling
    $newsize = $width.ToString() + ":" + $height.ToString()
    ffmpeg.exe -i $iimg -vf scale=$newsize $oimg
}
