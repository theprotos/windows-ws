@echo off
title Updating Apps
echo %stringStyle% Upgrade all %stringStyle%
set dateTimeFile=%date%_%time:~0,2%-%time:~3,2%-%time:~6,2%
set dateTimeFile=%dateTimeFile: =0%
@echo on
powershell "choco upgrade all -y -r | tee -a %SYSTEMDRIVE%\temp\choco-update%dateTimeFile%.log"
rmdir %LOCALAPPDATA%\Temp\chocolatey /s /q
@echo off
cls
echo.
echo.
echo Closing in 5 seconds..
ping 127.0.0.1 -w 1000 -n 5 > nul 2>&1
exit
