<#
@echo off
set BCKDIR="C:\Users\%username%\Documents\its372\lab03\backup"
cd /d %BCKDIR%
set _date=%DATE:/=-%
set _time=%TIME:/=-%
copy C:\Windows\System32\winevt\Logs\*security* .
"c:\Program Files\7-Zip\7z" a -t7z -mx9 -sdel  "backup-%_date%-%_time%.7z" *.evtx
#>

## Change the BCKDIR folder to yours!

# Go to the working folder
$BCKDIR = "C:\Users\$env:USERNAME\Documents\its372\lab04\"
Set-Location -Path $BCKDIR

# Generate achive file name based on date and time
$bckfile =  "backup-" + $(get-date -Format "MM-dd-HH-mm")+".zip"

# Copy all security related windows events to the backup folder under the working folder
Copy-Item -Path "C:\Windows\System32\winevt\Logs\*security*" -Destination ".\backup"

# Setup compress parameters
$compress = @{
    Path = ".\backup\*security*"
    CompressionLevel = "Fastest"
    DestinationPath = ".\backup\" + $bckfile
}

# Compress the copied event files
Compress-Archive @compress

# Remove the event files after they are archived
Remove-Item -Path ".\backup\*.evtx"
