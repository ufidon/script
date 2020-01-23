@echo off
:: This program shows file information
:: usage: fileinfo filename

:: if no parameter is provided, show the usage and exit
if [%~1]==[] ( 
call :usage 
exit /b 0
)

:: if /? is provided, show the usage and exit
if [%~1]==[/?] ( 
call :usage 
exit /b 0
)

:: if more than one parameter provided, show the usage and exit
if not [%~2]==[] ( 
call :usage 
exit /b 0
)

:: if one parameter is provided, but the file not exist show the problem and exit
if not exist %~1 ( 
echo. %~1 not exist!
exit /b 1
)

:: the file exists, show a choice table
:loop
:: show the choice table
echo. ----------------------------------------
echo. Please select what information you want:
echo. 1. Full pathname press f
echo. 2. Drive latter press d
echo. 3. Drive-less path press p
echo. 4. File name only press n
echo. 5. File name extension press x
echo. 6. File attributes press a
echo. 7. File modification date and time press t
echo. 8. File size press z
echo. 9. Quit press q
echo. ----------------------------------------
choice /c fdpnxatzq /m " Please press the corresponding key to select the information:"
echo. ****************************************
if %errorlevel% equ 1 (echo. & echo.^     Full pathname: & echo.^     %~f1 & echo.)
if %errorlevel% equ 2 (echo. & echo.^     Drive letter: & echo.^     %~d1 & echo.)
if %errorlevel% equ 3 (echo. & echo.^     Drive-less path: & echo.^     %~p1 & echo.)

REM TODO: complete functions 4-8 ***************************************
:: Don't modify anything outside of these two REMs
:: Add your code here.



REM TODO END.  *********************************************************

if %errorlevel% equ 9 exit /b 0
echo. ****************************************
goto :loop



:usage
setlocal
echo Usage: 
echo fileinfo filename
echo fileinfo /? show this help
endlocal