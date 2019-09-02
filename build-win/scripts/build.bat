@echo off
if /I [%1] EQU [vm] (
    set titleName=VM Setup
    title %titleName%
    goto main
)
if /I [%1] EQU [laptop] (
    set titleName=Laptop Setup
    title %titleName%
    goto main
)
if /I [%1] EQU [physical] (
    set titleName=Physical Machine Setup
    title %titleName%
    goto main
)
if /I [%1] EQU [test] (
    set titleName=TESTING
    title %titleName%
    goto testCase
) else (
    set titleName=Wrong parameter. Setup
    title %titleName%
    echo Closing in 15 seconds..
    ping 127.0.0.1 -w 1000 -n 15 > nul 2>&1
    exit
)
:main
title %titleName%
::#########################################
for /F "tokens=*" %%I in (%~dp0..\config\config.ini) do set %%I
::#########################################
echo.
@echo %stringStyle% Copying files locally %stringStyle%
xcopy /y /c %~dp0%scriptInitial% %temp%
xcopy /y /c %~dp0%scriptAppsInstall% %temp%
xcopy /y /c %~dp0%scriptAppsUpdate% %temp%
xcopy /y /c %~dp0%scriptPower% %temp%
xcopy /y /c %~dp0%scriptTimeUpdate% %temp%
echo.

if /I [%3] EQU [onlysoft] (
@echo %stringStyle% Installing Apps %stringStyle%
start /wait %scriptAppsInstall% %1 %2
echo.
goto exitNow
)

@echo %stringStyle% Create new task %1 %stringStyle%
::SchTasks /create /F /TN %taskName% /SC onlogon /delay 0000:30 /TR "%temp%\%scriptAppsUpdate% %1 %2" /RL HIGHEST
SchTasks /create /F /TN %taskName% /SC onlogon /delay 0000:30 /TR "%temp%\%scriptAppsUpdate%" /RL HIGHEST
::SchTasks /create /F /TN %taskTimeName% /SC ONEVENT /MO "*[System[Provider[@Name='Microsoft-Windows-Security-Auditing'] and EventID=4801]]" /EC Security /TR "%temp%\%scriptTimeUpdate%" /RL HIGHEST
SchTasks /create /F /TN %taskTimeName% /SC ONEVENT /MO "*[System[(EventID=4624)]] and  *[EventData[Data[9]="7"]]" /EC Security /TR "%temp%\%scriptTimeUpdate%" /RL HIGHEST
echo.
C:
::cd %ALLUSERSPROFILE%
::mkdir %dirName%
cd %temp%
@echo on
@echo %stringStyle% Starting Initial config %stringStyle%
start /wait %scriptInitial% %1
@echo.
@echo %stringStyle% Starting Power config %stringStyle%
start /wait %scriptPower% %1
@echo.
@echo %stringStyle% Installing Apps %stringStyle%
start /wait %scriptAppsInstall% %1 %2
@echo.
@echo %stringStyle% Installing Apps %stringStyle%
start /wait %scriptAppsUpdate% %1 %2
@echo.

if /I [%3] EQU [activate] (
@echo %stringStyle% Install Office 2019 x64 %stringStyle%
start /d %~dp0 /wait %scriptTools% office
echo.
@echo %stringStyle% Activate Windows and Office %stringStyle%
start /d %~dp0 /wait %scriptTools% activate
)

:testCase
@echo %stringStyle% Start menu icons %stringStyle%
set scriptStartMenu=start-menu.bat
start /d %~dp0 /wait %scriptStartMenu% %1 %startLayout%
@echo off
echo.
echo.
:exitNow
echo Closing in 15 seconds..
ping 127.0.0.1 -w 1000 -n 15 > nul 2>&1
exit
