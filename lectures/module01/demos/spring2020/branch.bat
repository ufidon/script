@echo off

set targetpath=%1

if exist %targetpath% (
  echo %targetpath% found.
  exit /b 0
) else (
	echo %targetpath% not exist!
	exit /b 1
)