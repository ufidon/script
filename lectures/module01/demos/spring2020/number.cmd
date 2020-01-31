@echo off

echo computation
set /a num1="255^127"
echo %num1%
set /a "num2=255^127"
echo %num2%
set /a num3=255^^127
echo %num3%

set n1=40 & set n2=25
set /a n3=%n1%+%n2%
echo %n3%
set /a n4=n1+n2
echo %n4%






