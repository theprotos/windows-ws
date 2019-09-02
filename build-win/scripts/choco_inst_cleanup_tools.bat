@echo off
title Install Cleanup tools
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
::::@powershell -NoProfile -ExecutionPolicy RemoteSigned -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco install -y chocolatey
choco install -y powershell -pre
choco install -y ccleaner
choco install -y ccenhancer
choco install -y chocolateygui
choco install -y bleachbit
choco upgrade all -y
