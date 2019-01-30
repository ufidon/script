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

:: :start
:: set /p yname=What is your name:
:: :: set /p yloc=Where are you from:
:: set /p yage=Your age:
:: 
:: if %yage% GEQ 21  (echo. %yname% can have a gun. 
:: ) else (
:: echo. %yname% can NOT have a gun.
:: )
:: 
:: set /p option=Do you want to quit(y/n):
:: if %option%==y exit /b 3
::  
:: echo. continue the program
:: goto :start


:: --- 8. repetition ----
::for %%i in (0,1,5) do echo. %%i
::for /L %%i in (0,1,5) do echo. %%i
::
:::: for (i=0; i<=5; ++i) printf("%d\n",i)

:: while loop
:: while(condition){statements}
:: int i=0;
:: while(i<5){printf("%d\n", i);}

:: set /a i=0
:: 
:: :while
:: if %i% lss 5 (
:: 	echo %i%
:: 	set /a i+=1
:: 	goto :while
:: )

:: do 
:: {
:: 	statements;
:: }while(condition)

:: set /a i=0
:: 
:: :do
:: 	echo %i%
:: 	set /a i+=1
:: if %i% lss 5 goto :do

:: choice /c ync /m "press y for yes, press n for no, press c for cancel"
:: 
:: if %errorlevel% equ 1 (
:: 	echo. You pressed yes
:: )
:: 
:: if %errorlevel% equ 2 (
:: 	echo. You chose no
:: )
:: 
:: if %errorlevel% equ 3 (
:: 	echo. You chose cancel
:: )

:: --- 8. command line arguments processing ---
:: int main(int argc, char* []) 	

:: echo.	All parameters: %*
:: echo.	Program name: %0
:: echo.	The 1st parameter: %1
:: echo.	The 2st parameter: %2
:: 
:: if "%3" == "" echo. The 3rd is empty
:: 
:: set /a argc=0
:: 
:: :nonempty
:: if not "%1" == "" (
:: set /a argc+=1
:: echo. %1 %2 %3 %4
:: shift
:: ::echo. %1 %2 %3 %4
:: goto :nonempty
:: )
:: 
:: 
:: 
:: echo. The number of arguments is %argc%

:: ---- 9. file properties -----
:: echo. Full name : %~f1 %~f2
:: echo. Name without quotes: %~1
:: echo. Drive letter: %~d1
:: echo. File name only: %~n1
:: echo. File extension: %~x1
:: echo. File attributes: %~a1
:: echo. File modification time: %~t1
:: echo. File size: %~z1


:: ---- 10. functions -------
:: if "%1" == "" (
:: 	echo. usage: hello num1 num2
:: 	exit /b 1
:: )
:: 
:: if  not "%3" == "" (
:: 	echo. usage: hello num1 num2
:: 	exit /b 2
:: )
:: 
:: 
:: set /a sum=%1+%2 
:: echo %1 + %2 = %sum%
:: 
:: exit /b 0

:: set /p num1="Enter num1:"
:: set /p num2="Enter num2:"
:: 
:: call :sum %num1% %num2%
:: echo. %num1% + %num2% = %result%
:: call :product %num1% %num2%
:: echo. %num1% * %num2% = %pro%
:: 
:: call :varsum %num1% %num2% 40 50
:: echo. the sum = %result%
:: 
:: exit /b 0
:: 
:: :sum
:: setlocal
:: set /a sum=%1+%2
:: 
:: endlocal & set result=%sum%
:: 
:: :product
:: setlocal
:: set /a pro=%1*%2
:: endlocal & set pro=%pro%
:: 
:: :varsum
:: setlocal
:: 
:: set /a tsum=0
:: 
:: :nonempty
:: if not "%1" == "" (
:: set /a tsum+=%1
:: shift
:: goto :nonempty
:: )
:: 
:: endlocal & set result=%tsum%

echo. Hello is here!

:: ---- 11. redirections -------

:: ---- 12. wildcards -------

:: ---- 13. more string processing ----


:: ---- 14. environment variables ----











