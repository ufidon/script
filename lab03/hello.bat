@echo off

:: ---- 1. This is a beginning-------
:: REM This is my hello world batch program
:: 
:: echo.Hello World!
:: 
:: :: show all files and subfolders in the current folder
:: dir /b
:: 
:: 
:: echo on

:: ----2. Variables declaration ------------
:: set fname=trump
:: set lname=Donald
:: 
:: echo.Welcome %fname% %lname%
:: 
:: set strx=10
:: set /a numx=20
:: 
:: echo. strx=%strx% is not %numx%

:: ---- 3. Arithmatics -------
:: set /a x1=10
:: set /a x2=0x10
:: set /a x3=010
:: 
:: set /a "y1=x1+x2"
:: echo. %x1% + %x2% = %y1%
:: set /a "y1=x1-x2"
:: echo. %x1% - %x2% = %y1%
:: set /a "y1=x1*x2"
:: echo. %x1% * %x2% = %y1%
:: set /a "y1=x1/x2"
:: echo. %x1% / %x2% = %y1%
:: set /a "y1=x1 %% x2"
:: echo. %x1% %% %x2% = %y1%

:: ---- 4. Bit operations ----------
:: 0xff = 0b11111111
::set /a a=0xff
:::: 0xaa = 0b10101010
::set /a b=0xaa
::
:::: ^ is XOR
::set /a "c=a ^ b"
::echo. %a% ^^ %b% = %c%
:::: 0xff = 0b11111111
:::: 0xaa = 0b10101010
:::: ^    = 0b01010101
:::: hex  = 0x55
:::: dec  = 5*16+5=80+5=85
::
::
::set /a "c=a & b"
::echo. "%a% & %b% = %c%"
::set /a "c=a | b"
:::: single quotes still need escaping
::echo. '%a% ^| %b% = %c%'

:: --- 5. string operations ----
:: set pnw=purdue university northwest
:: echo. %pnw%
:: 
:: echo. %pnw:~0,2%
:: echo. %pnw:~7,10%
:: 
:: echo. %pnw:~-3%

:: --- 6. User input/output ---
::set /p yname=What is your name:
::set /p yloc=Where are you from:
::
::echo. %yname% are from %yloc%

:: --- 7. branch --------- 

:start
set /p yname=What is your name:
:: set /p yloc=Where are you from:
set /p yage=Your age:

if %yage% GEQ 21  (echo. %yname% can have a gun. 
) else (
echo. %yname% can NOT have a gun.
)

set /p option=Do you want to quit(y/n):
if %option%==y exit /b 3
 
echo. continue the program
goto :start


:: --- 8. repetition ----
::for %%i in (0,1,5) do echo. %%i
::for /L %%i in (0,1,5) do echo. %%i
::
:::: for (i=0; i<=5; ++i) printf("%d\n",i)












