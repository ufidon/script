@echo off
:: ping -n 6 127.0.0.1 >nul & REM wait
:: pause
:: echo B

for /L %%i in (1,1,10) do (
  ping -n 2 127.0.0.1 >nul & REM wait
  pause
  echo B
)