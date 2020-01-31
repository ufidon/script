@echo off
:: string processing

:: string concatination ===============
:: set firstname=Trump
:: set lastname= Donald
:: set clinton="Bill Clinton "
:: 
:: echo %firstname%
:: echo %lastname%
:: echo %clinton%
:: 
:: set fullname=%firstname% %lastname%
:: echo %fullname%

:: substring =======================
::set str=0123456789
::echo index+lenth
::echo %str:~0,4%
::echo %str:~5,3%
::
::echo index to the end
::echo %str:~7%
::echo %str:~-1%
::echo %str:~-5%
::
::echo index:neg index
::echo -0 is the lastone for the neg index
::echo %str:~5,-1%
::echo %str:~7,-2%
::echo %str:~8,-5%
::echo %str:~8,-0%
::echo %str:~8,0%
::echo
::echo

:: echo string starting
:: set str=0123456789
:: if %str:~0,3% == 012  echo yes
:: (if %str:~0,3% == abc echo yes ) || echo no

::set str=0123456789
::echo %str:5=a%
::echo %str:*5=a%
::echo %str%
::
::set str2=112233555444555333
::echo %str2:5=a%
::echo %str2:*5=a%
::echo %str2%
::
::set str3=abcdefghbcbhc
::echo %str3:bc=%
::
::if not %str3:bc=% == %str3% echo yes
::if not %str3:01=% == %str3% echo yes

::echo the assignment
::set var=a a, c;    "d REM hello"
::set var1=a a, c;    'd :: hello'
::echo %var%
::for %%c in (%var%) do echo %%c
::echo %var1%
::for %%c in (%var1%) do echo %%c

:: echo parameter processing
:: 
:: if not -%1- == -- echo arg1 is provided
:: if not "%2" == "" echo arg2 is provided
:: 
:: :argactionstart
:: if -%1-==-- goto argactionend
:: echo %1 & REM Or do any other thing with the argument
:: shift
:: goto argactionstart
:: :argactionend

echo computation
set /a num1="255^127"
echo %num1%
set /a "num2=255^127"
echo %num2%
set /a num3=255^^127
echo %num3%





