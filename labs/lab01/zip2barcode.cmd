:: from http://www.bluffton.edu/homepages/facstaff/nesterd/batch-examples.html#zipcode.txt
@echo off
rem Fewer than 5 digits?
if _%5==_ goto BadInput
if _%6==_ goto FiveDigits
rem More than 5, but fewer than 9 digits?
if _%9==_ goto BadInput

:FiveDigits
set digits=
set ziperror=NO
rem If there are only five digits, %6--%9 are blank
for %%v in (%1 %2 %3 %4 %5 %6 %7 %8 %9) do call onedigit %%v
rem ziperror set to YES if any characters were not digits.
if %ziperror%==YES goto BadInput
rem Following two lines check to see if more than 9 numbers were given
shift
if not _%9==_ goto BadInput

echo %digits%
goto Finished

:BadInput
echo You must enter either 5 or 9 numbers.
:Finished
echo.
rem Clean up environment.
set digits=
set thisdigit=
set ziperror=