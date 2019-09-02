rd /S /Q c:\ProgramData\chocolatey\
rmdir %LOCALAPPDATA%\Temp\chocolatey /s /q

echo Closing in 5 seconds..
ping 127.0.0.1 -w 1000 -n 5 > nul 2>&1
exit