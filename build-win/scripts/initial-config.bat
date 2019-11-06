@echo off
::https://gist.github.com/alirobe/1e9fb1fd8eefd72ce5cd372459a88b59
if [%1] EQU [vm] (
    set titleName=VM Setup. Config
    title %titleName%
    goto main
)
if [%1] EQU [laptop] (
    set titleName=Laptop Setup. Config
    title %titleName%
    goto main
)
if [%1] EQU [physical] (
    set titleName=Physical Machine Setup. Config
    title %titleName%
    goto main
) else (
    set titleName=Wrong parameter. Config
    title %titleName%
    echo Closing in 15 seconds..
    ping 127.0.0.1 -w 1000 -n 15 > nul 2>&1
    exit
)
:main
::#########################################
set stringStyle=#################
title %titleName% 1/24 [#-----------------------]
@echo %stringStyle% Disable remote access %stringStyle%
@reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance"           /f /v "fAllowToGetHelp"                    /t REG_DWORD /d 0
@reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance"           /f /v "fAllowFullControl"                  /t REG_DWORD /d 0
echo.
title %titleName% 2/24 [##----------------------]
@echo %stringStyle% Device Manager show all devices %stringStyle%
@reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /v "DEVMGR_SHOW_NONPRESENT_DEVICES" /t REG_DWORD /d 1
echo.
title %titleName% 3/24 [###---------------------]
@echo %stringStyle% NO SOUND SCHEME %stringStyle%
::Disable Windows sound for all users
@reg add "HKU\.DEFAULT\AppEvents\Schemes"   /VE /T REG_SZ /F /D ".NONE"
::Disable Windows sound for all current user
@reg add "HKCU\AppEvents\Schemes"           /VE /T REG_SZ /F /D ".NONE"
::Changing Scheme
title %titleName% 4/24 [####--------------------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes"                                                      /t REG_SZ /d ".NONE"  /f
::Changing sounds
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\.Default\.Current"                      /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\AppGPFault\.Current"                    /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Close\.Current"                         /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\CriticalBatteryAlarm\.Current"          /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current"                 /t REG_SZ /d ""       /f
echo.
title %titleName% 5/24 [#####-------------------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceDisconnect\.Current"              /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceFail\.Current"                    /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\FaxBeep\.Current"                       /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\LowBatteryAlarm\.Current"               /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\MailBeep\.Current"                      /t REG_SZ /d ""       /f
echo.
title %titleName% 6/24 [######------------------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Maximize\.Current"                      /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\MenuCommand\.Current"                   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\MenuPopup\.Current"                     /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\MessageNudge\.Current"                   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Minimize\.Current"                      /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Default\.Current"          /t REG_SZ /d ""       /f
echo.
title %titleName% 7/24 [#######-----------------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.IM\.Current"               /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm\.Current"    /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm1\.Current"   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm2\.Current"   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm3\.Current"   /t REG_SZ /d ""       /f
echo.
title %titleName% 8/24 [########----------------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm4\.Current"   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm5\.Current"   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm6\.Current"   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm7\.Current"   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm8\.Current"   /t REG_SZ /d ""       /f
echo.
title %titleName% 9/24 [#########---------------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm9\.Current"   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm10\.Current"  /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Mail\.Current"             /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Reminder\.Current"         /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Open\.Current"                          /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\PrintComplete\.Current"                 /t REG_SZ /d ""       /f
echo.
title %titleName% 10/24 [##########--------------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\RestoreDown\.Current"                   /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\RestoreUp\.Current"                     /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemAsterisk\.Current"                /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemExclamation\.Current"             /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemExit\.Current"                    /t REG_SZ /d ""       /f
echo.
title %titleName% 11/24 [###########-------------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemHand\.Current"                    /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemNotification\.Current"            /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemQuestion\.Current"                /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\WindowsLogoff\.Current"                 /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\WindowsLogon\.Current"                  /t REG_SZ /d ""       /f
echo.
title %titleName% 12/24 [############------------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\WindowsUAC\.Current"                    /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\BlockedPopup\.current"                  /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\EmptyRecycleBin\.Current"               /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\FaxError\.current"                      /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\FaxLineRings\.current"                  /t REG_SZ /d ""       /f
echo.
title %titleName% 13/24 [#############-----------]
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\FaxSent\.current"                       /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\FeedDiscovered\.current"                /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\Navigating\.Current"                    /t REG_SZ /d ""       /f
@reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\SecurityBand\.current"                  /t REG_SZ /d ""       /f
echo.
title %titleName% 14/24 [##############----------]
@echo %stringStyle% Add UA and RU languages %stringStyle%
@reg add "HKEY_CURRENT_USER\Keyboard Layout\Preload"                         /t REG_SZ /v 2         /d "00000419" /f
@reg add "HKEY_CURRENT_USER\Keyboard Layout\Preload"                         /t REG_SZ /v 3         /d "00000422" /f
@reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Locale"    /t REG_SZ /v (Default) /d "00000419" /f
echo.
title %titleName% 15/24 [###############---------]
@echo %stringStyle% HIDDEN FILES and KNOWN Extentions %stringStyle%
@REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V HideFileExt     /T REG_DWORD /F /D 0
@REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Hidden          /T REG_DWORD /F /D 1
@REG add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowSuperHidden /T REG_DWORD /F /D 1
echo.
title %titleName% 16/24 [################--------]
@echo %stringStyle% Change TIMEZONE %stringStyle%
@tzutil /s "FLE Standard Time"
@reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /t REG_SZ /v NtpServer        /d "pool.ntp.org" /f
@reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /v SpecialPollInterval /T REG_DWORD /F /D 3600
net start w32time
title %titleName% 17/24 [#################-------]
@echo %stringStyle% Change TIME FORMAT %stringStyle%
@reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v sShortDate        /d "dd.MM.yyyy" /f
@reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v iFirstDayOfWeek   /d "0"          /f
@reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v iFirstWeekOfYear  /d "0"          /f
@reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v sShortTime        /d "H:mm"       /f
@reg add "HKEY_CURRENT_USER\Control Panel\International" /t REG_SZ /v sDate             /d "."          /f
echo.
title %titleName% 18/24 [##################------]
@echo %stringStyle% SET UNC path in cmd %stringStyle%
@reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /V DisableUNCChecks /T REG_DWORD /F /D 1
echo.
@echo %stringStyle% Always show icons and notifications on the taskbar %stringStyle%
@reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray /T REG_DWORD /F /D 0
echo.
title %titleName% 19/24 [###################-----]
@echo %stringStyle% Performance: Disable visual style %stringStyle%
@reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /T REG_DWORD /F /D 2
echo.
@echo %stringStyle% Enable Login Screen Background Image %stringStyle%
@reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System"            /v DisableLogonBackgroundImage /T REG_DWORD /F /D 0
echo.
@echo %stringStyle% Disable swype Screen Background Image %stringStyle%
@reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization"   /v  NoLockScreen               /T REG_DWORD /F /D 1
echo.
title %titleName% 20/24 [####################----]
@echo %stringStyle% Screen saver timeout %stringStyle%
@reg add "HKEY_CURRENT_USER\Control Panel\Desktop"                                  /v  ScreenSaveTimeOut          /T REG_SZ /F /D 600
echo.
@echo %stringStyle% Password protect the screen saver %stringStyle%
@reg add "HKEY_CURRENT_USER\Control Panel\Desktop"                                  /v  ScreenSaverIsSecure        /T REG_SZ /F /D 1
echo.
@echo %stringStyle% Suggested Apps, Feedback, Lockscreen Spotlight %stringStyle%
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"            /f /v SystemPaneSuggestionsEnabled  /t REG_DWORD  /d 0
@reg add "HKCU\Software\Microsoft\CurrentVersion\ContentDeliveryManager\SoftLandingEnabled"  /f /v SoftLandingEnabled           /t REG_DWORD  /d 0
@reg add "HKCU\Software\Microsoft\CurrentVersion\ContentDeliveryManager"                    /f /v RotatingLockScreenEnable      /t REG_DWORD  /d 0
echo.
title %titleName% 21/24 [#####################---]
@echo %stringStyle% Disable telemetry %stringStyle%
@reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection"           /f /v "AllowTelemetry"                     /t REG_DWORD /d 0
@reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata"    /f /v "PreventDeviceMetadataFromNetwork"   /t REG_DWORD /d 1
@reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT"                              /f /v "DontOfferThroughWUAU"               /t REG_DWORD /d 1
@reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows"                /f /v "CEIPEnable"                         /t REG_DWORD /d 0
@reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat"                /f /v "AITEnable"                          /t REG_DWORD /d 0
@reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat"                /f /v "DisableUAR"                         /t REG_DWORD /d 1


@echo %stringStyle% Disable 8.3 names and Last Access speeds up disk access %stringStyle%
@reg add "HKCU\SYSTEM\CurrentControlSet\Control\FileSystem" /f /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d 1
@reg add "HKCU\SYSTEM\CurrentControlSet\Control\FileSystem" /f /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1

echo.
@echo %stringStyle% Notify before download updates %stringStyle%
@reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU"    /v  "AUOptions"        /T REG_DWORD /F /D 2
echo.

@echo %stringStyle% Disable location %stringStyle%
@reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"    /v  "Value"        /T REG_SZ /F /D "Deny"
@reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E6AD100E-5F4E-44CD-BE0F-2265D88D14F5}"    /v  "Value"        /T REG_SZ /F /D "Deny"
@reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"  /v  "SensorPermissionState"        /T REG_DWORD /F /D 0
echo.

@echo %stringStyle% Disable Defender %stringStyle%
@reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender"                           /v  "DisableAntiSpyware"                /T REG_DWORD /F /D 1
@reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"      /v  "DisableRealtimeMonitoring"         /T REG_DWORD /F /D 1
@reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray"   /v  "HideSystray"                       /T REG_DWORD /F /D 1
echo.

title %titleName% 22/24 [######################--]
@echo %stringStyle% Never ask for feedback %stringStyle%
@reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v  "NumberOfSIUFInPeriod"        /T REG_DWORD /F /D 0
echo.
@echo %stringStyle% Disabling Cortana and Bing search %stringStyle%
@reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search"       /v "AllowCortana"           /t REG_DWORD /d 0 /f
@reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"         /v "CortanaEnabled"         /t REG_DWORD /d 0 /f
@reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"         /v "SearchboxTaskbarMode"   /t REG_DWORD /d 0 /f
@reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"         /v "BingSearchEnabled"      /t REG_DWORD /d 0 /f
echo.

@echo %stringStyle% Disabling OneDrive %stringStyle%
@reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive"                            /f /t REG_DWORD     /v DisableFileSyncNGSC  /d 1
@reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive"                            /f /t REG_DWORD     /v DisableFileSync      /d 1
@reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"  /f /t REG_BINARY    /v OneDrive             /d 0300000021B9DEB396D7D001

echo.
@echo %stringStyle% half-open TCP connections limit %stringStyle%
@reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"        /f /t REG_DWORD     /v EnableConnectionRateLimiting  /d 0
echo.
@echo %stringStyle% half-open TCP connections limit %stringStyle%
@reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /f /t REG_DWORD /v AllowgameDVR /d 0
@reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /f /t REG_DWORD /v AppCaptureEnabled /d 0
@reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /f /t REG_DWORD /v HistoricalCaptureEnabled  /d 0
echo.
@echo %stringStyle% disable useless services %stringStyle%
sc config "lfsvc"           start= disabled
sc config "CscService"      start= disabled
sc config "DiagTrack"       start= disabled
sc config "SCardSvr"        start= disabled
sc config "DPS"             start= disabled
sc config "Fax"             start= disabled
sc config "XblAuthManager"  start= disabled
sc config "XblGameSave"     start= disabled
sc config "bthserv"         start= disabled

echo.
title %titleName% 23/24 [#######################-]
@echo %stringStyle% Add linux command to windows system variables %stringStyle%
setx -m LINUXBIN_HOME "C:\Program Files\Git\usr\bin"
setx -m CHOCOBIN_HOME "C:\ProgramData\chocolatey\bin"
setx -m GOPATH "C:\tools\go"
setx path "%path%;%LINUXBIN_HOME%;%CHOCOBIN_HOME%;%GOPATH%\bin"
title %titleName% 24/24 [########################]
echo.

if [%2] EQU [dev] (
powershell Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
)
echo.
@echo off
echo Closing in 5 seconds..
ping 127.0.0.1 -w 1000 -n 5 > nul 2>&1
exit
