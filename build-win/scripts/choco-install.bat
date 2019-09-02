@echo off
if [%1] EQU [vm] (
    set titleName=VM Setup. Applications
    title %titleName%
    goto main
)
if [%1] EQU [laptop] (
    set titleName=Laptop Setup. Applications
    title %titleName%
    goto main
)
if [%1] EQU [physical] (
      set titleName=Physical Machine Setup. Applications
      title %titleName%
      goto main
) else (
     set titleName=Wrong parameter. Applications
     title %titleName%
     echo Closing in 15 seconds..
     ping 127.0.0.1 -w 1000 -n 15 > nul 2>&1
     exit
)
:main
::#########################################
set stringStyle=#################
::#########################################
set dateTimeFile=%date%_%time:~0,2%-%time:~3,2%-%time:~6,2%
set dateTimeFile=%dateTimeFile: =0%
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
::::@powershell -NoProfile -ExecutionPolicy RemoteSigned -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
cls
echo Started > %SYSTEMDRIVE%\temp\choco-install%dateTimeFile%.log
set installParam=-y -r --ignore-checksum
title %titleName% [#------------]
echo %stringStyle% Windows Ecosystem %stringStyle%
choco install %installParam% chocolatey
choco install %installParam% chocolatey-core.extension
choco install %installParam% powershell
choco install %installParam% powershell -pre
choco install %installParam% chocolateygui
choco install %installParam% dotnet4.5
choco install %installParam% dotnet3.5
choco install %installParam% silverlight
choco install %installParam% python
choco install %installParam% jre8
cls
title %titleName% [###---------]
echo %stringStyle% Browsers %stringStyle%
choco install %installParam% firefox
choco install %installParam% google-chrome-x64
choco install %installParam% tor-browser
choco uninstall %installParam% opera
cls
title %titleName% [####---------]
::#########################################
if [%2] EQU [dev] (
    echo %stringStyle% Development Tools %stringStyle%
    choco install %installParam% golang
    choco install %installParam% ruby
    choco install %installParam% pip
    choco install %installParam% curl
    choco install %installParam% jdk8
    choco install %installParam% maven
    choco install %installParam% gradle
    choco install %installParam% nodejs
    choco install %installParam% sysinternals
    choco install %installParam% jetbrainstoolbox
    choco install %installParam% winbox
    choco install %installParam% netbeans
    choco install %installParam% eclipse
    choco install %installParam% linqpad4
    choco install %installParam% sqlserverlocaldb
    choco install %installParam% visualstudiocode
    choco install %installParam% insted
    choco install %installParam% wireshark
    choco install %installParam% fiddler
    cls
    title %titleName% [#####--------]
    echo %stringStyle% D-VCS %stringStyle%
    choco install %installParam% git.install
    choco install %installParam% hg
    choco uninstall %installParam% githubforwindows
    choco install %installParam% cygwin
    choco install %installParam% cmder
    choco install %installParam% console2
    choco install %installParam% nmap
    choco install %installParam% filezilla
    choco install %installParam% putty
    choco install %installParam% winscp
    choco install %installParam% wudt
    choco install %installParam% unetbootin
    choco install %installParam% veracrypt
    choco install %installParam% rufus
    cls
    title %titleName% [#####--------]
    echo %stringStyle% DevOps %stringStyle%
    choco uninstall %installParam% docker
    choco uninstall %installParam% docker-machine
    choco uninstall %installParam% kubernetes-cli
    choco install %installParam% vagrant
    choco install %installParam% packer
    choco uninstall %installParam% minikube
    choco uninstall %installParam% minishift
    choco install %installParam% terraform
)
cls
title %titleName% [######-------]
echo %stringStyle% System tools %stringStyle%
if [%2] NEQ [minimal] (
    choco install %installParam% ccleaner
    choco install %installParam% bleachbit
    choco install %installParam% ccenhancer
    choco install %installParam% windirstat
) else (
    choco uninstall %installParam% ccleaner
    choco uninstall %installParam% bleachbit
    choco uninstall %installParam% ccenhancer
    choco uninstall %installParam% windirstat
)
choco install %installParam% 7zip.install
choco install %installParam% cpu-z
choco install %installParam% totalcommander
choco install %installParam% procexp
choco install %installParam% hwinfo.install
cls
title %titleName% [#######------]
echo %stringStyle% Adobe software %stringStyle%
choco uninstall %installParam% flashplayerplugin
choco install %installParam% flashplayerplugin
choco install %installParam% adobereader
choco uninstall %installParam% adobeshockwaveplayer
choco uninstall %installParam% adobeair
cls
title %titleName% [########-----]
echo %stringStyle% Media tools %stringStyle%
choco install %installParam% vlc
choco install %installParam% aimp
choco install %installParam% irfanview
if [%2] NEQ [minimal] (
    choco install %installParam% paint.net
    choco install %installParam% kodi
) else (
    choco uninstall %installParam% paint.net
    choco uninstall %installParam% kodi
)
cls
title %titleName% [#########----]
echo %stringStyle% IDE and Text tools %stringStyle%
choco install %installParam% atom
choco install %installParam% libreoffice
choco install %installParam% sublimetext3
cls
title %titleName% [##########---]
echo %stringStyle% Network %stringStyle%
choco install %installParam% teamviewer
choco uninstall %installParam% viber
if [%2] NEQ [minimal] (
    choco install %installParam% keepass.install
    choco install %installParam% uget
    choco install %installParam% mobaxterm
) else (
    choco uninstall %installParam% keepass.install
    choco uninstall %installParam% uget
    choco uninstall %installParam% mobaxterm
)
cls
@echo off
title %titleName% [###########--]
echo %stringStyle% Non-VM or VM %stringStyle%
if [%1] EQU [vm] (
    choco uninstall %installParam% dropbox
    choco uninstall %installParam% skype
    choco uninstall %installParam% virtualbox.extensionpack
    choco uninstall %installParam% virtualbox
    choco uninstall %installParam% f.lux
    choco uninstall %installParam% qbittorrent
    choco uninstall %installParam% steam
    cls
) else (
    choco install %installParam% skype
    if [%2] NEQ [minimal] (
        choco install %installParam% dropbox
        choco install %installParam% google-backup-and-sync
        choco install %installParam% virtualbox
        choco install %installParam% virtualbox.extensionpack
        choco install %installParam% f.lux
        choco install %installParam% qbittorrent
        choco install %installParam% steam
        cls
    ) else (
        choco uninstall %installParam% dropbox
        choco uninstall %installParam% virtualbox
        choco uninstall %installParam% virtualbox.extensionpack
        choco uninstall %installParam% f.lux
        choco uninstall %installParam% qbittorrent
        choco uninstall %installParam% steam
    )
)
title %titleName% [############-]
echo %stringStyle% AVAST Antivitus %stringStyle%
choco install %installParam% avastfreeantivirus
title %titleName% [#############]
cls

echo %stringStyle% Cleanup temporary directories %stringStyle%
rmdir %LOCALAPPDATA%\Temp\chocolatey /s /q
cls
@echo off
echo.
echo.
echo Closing in 5 seconds..
ping 127.0.0.1 -w 1000 -n 5 > nul 2>&1
exit
