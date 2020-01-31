@echo off

setlocal
set n=%1

:print_primes_loop
::set /a n=n+1
set cand_divisor=1

:print_primes_loop2

set /a cand_divisor=cand_divisor+1
set /a cand_divisor_squared=cand_divisor*cand_divisor
if %cand_divisor_squared% gtr %n% echo %n% is a prime & goto :end
set /a modulo=n%%cand_divisor
if %modulo% equ 0 echo %n% is a compound number  & goto :end & REM Not a prime

goto :print_primes_loop2
:end