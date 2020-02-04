@echo off

:: functions

call :power 2 4

echo %result%
rem Prints 16, determined as 2 * 2 * 2 * 2
goto :eof

rem __Function power______________________
rem Arguments: %1 and %2
:power
setlocal
set exponent=%2
set interim_product=%1
:power_loop
if %exponent% gtr 1 (
  set /a interim_product=interim_product * %1
  set /a exponent=exponent - 1
  goto :power_loop
)

echo %1 raised to %2 = %interim_product%
endlocal & set result=%interim_product%

goto :eof