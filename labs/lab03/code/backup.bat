@echo off
set BCKDIR="C:\Users\%username%\Documents\its372\lab03\backup"
cd /d %BCKDIR%
set _date=%DATE:/=-%
set _time=%TIME:/=-%
copy C:\Windows\System32\winevt\Logs\*security* .
"c:\Program Files\7-Zip\7z" a -t7z -mx9 -sdel  "backup-%_date%-%_time%.7z" *.evtx