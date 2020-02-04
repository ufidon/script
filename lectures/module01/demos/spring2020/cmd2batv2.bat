@echo off

set filedir=%1
set oldext=%2
set newext=%3

:: filename: cmd2bat.bat
:: description: convert all cmd file within a folder and its subfolder to bat file

cd %filedir%

for /r %%i in (*.%oldext%) do (
echo --------------------------------------
echo %%i is renamed:
call :parsefile %%i
echo --------------------------------------
)

goto :eof

:parsefile
setlocal
	echo %~1 : %%1 with no enclosing quotation marks
	set oldfn=%~dpn1
	set newfn=%oldfn%.%newext%
	echo == convert from %~1 to %newfn%
	move %~1 %newfn%
endlocal



