<# Ref solution for the review question
  Run from the folder that contains the animals folder
 #Invoke-WebRequest -Uri "https://openclipart.org/image/800px/192055" -OutFile ".\animals\Mammalia\dog.jpg"

 $url = "https://openclipart.org/image/800px/223164"
 $file = ".\animals\Insecta\dragonfly.jpg"

 Invoke-WebRequest -Uri $url -OutFile $file
 #>

# change the path to yours
$env:Path = $env:Path + ";C:\Program Files\ImageMagick-7.0.11-Q16"

# change the path to yours
$imgdir = "C:\Users\Administrator\Documents\its372\lab05\animals"
$width = 512
$height = 512

Get-ChildItem -Path $imgdir -Recurse -File | ForEach-Object {
    # ref: https://imagemagick.org/script/command-line-processing.php
    $newsize = $width.ToString() + "x" + $height.ToString() + "!"
    $iimg = $_

    # new_image_name = older_image_name-widthxheight.jpg
    $oimg = $_.Directory.ToString() +"\" +$_.BaseName + "-" + $width.ToString() + "x" + $height.ToString() +".jpg"

    # ref: https://imagemagick.org/script/command-line-processing.php
    # source images with subtle problems will not work
    magick convert -resize $newsize   "$iimg"  "$oimg"  
}
