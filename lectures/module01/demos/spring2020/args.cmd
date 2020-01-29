@echo off

echo %0
echo %1
echo %2

:argactionstart
if -%1-==-- goto argactionend
echo %1 & REM Or do any other thing with the argument
shift
goto argactionstart
:argactionend