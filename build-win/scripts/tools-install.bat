@echo off
::#########################################
set pathTools=%~dp0%..\bin\office2019
set pathConfig=%~dp0%..\config
::#########################################
cd %pathTools%
if [%1] EQU [activate] (
    title Activate windows and Office
    echo Running KMS Auto -- Windows ACTIVATE and SCHEDULE
    "KMSAuto Net.exe" /sched=win /win=act
    echo Running KMS Auto -- Office ACTIVATE and SCHEDULE
    "KMSAuto Net.exe" /sched=off /off=act /off=conv
)
if [%1] EQU [office] (
    title Install Office
    echo Install Office X64
    OInstall.exe /configure %pathConfig%\Office64.xml
    ::echo Install Office X32
    ::OInstall.exe /configure %pathConfig%\Office32.xml
)
echo.
echo.
echo Closing in 5 seconds..
ping 127.0.0.1 -w 1000 -n 5 > nul 2>&1
exit
