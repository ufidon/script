@echo off

:: file parameter parsement

echo %~1 : %%1 with no enclosing quotation marks
echo %~dp1 : drive letter and path
echo %~n1 : only file name
echo %~x1 : extension with the dot