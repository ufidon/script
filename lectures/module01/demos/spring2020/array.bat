@echo off

setlocal EnableDelayedExpansion

for /l %%i in (1, 1, 10) do (
  set array_%%i=!random!
)

for /l %%i in (1, 1, 10) do (
  echo array_%%i: !array_%%i!
)

:: For each item in the array, not knowing the length
set i=1
:startloop
if not defined array_%i% goto endloop
set array_%i%=!array_%i%!_dummy_suffix
echo A%i%: !array_%i%!
set /a i+=1
goto startloop
:endloop