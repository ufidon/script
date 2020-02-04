@echo off

:: construct while loop
:: while condition {loop body}

echo This is a while loop
set i=1

:startloop
if /I %i% GTR 10 goto endloop

echo %i%

set /a i+=1

goto startloop
:endloop

:: construct do-while loop
echo This is a do-while loop
set i=1

:startloop2

echo %i%

set /a i+=1

if /I %i% GTR 10 ( 
	goto endloop2  
) else ( 
	goto startloop2
)
:endloop2
