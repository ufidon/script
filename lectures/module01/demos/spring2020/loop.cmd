@echo off

for %%i in (1,2, a, b, hello, #) do echo %%i

:: regular expression

for %%i in (*.cmd) do echo %%i