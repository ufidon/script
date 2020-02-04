@echo off

:: filename: cmd2bat.bat
:: description: convert all cmd file within a folder and its subfolder to bat file


for /r %%i in (*.cmd) do (
echo --------------------------------------
echo %%i is parsed:
call :parsefile %%i
echo --------------------------------------
)

:parsefile
setlocal
	echo %~1 : %%1 with no enclosing quotation marks
	echo %~dp1 : drive letter and path
	echo %~n1 : only file name
	echo %~x1 : extension with the dot	
endlocal

