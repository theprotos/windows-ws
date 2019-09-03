title Cleanup Windows

Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
Dism.exe /online /Cleanup-Image /StartComponentCleanup
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
Dism.exe /online /Cleanup-Image /SPSuperseded
cleanmgr.exe /force full

echo.
echo.
echo Closing in 5 seconds..
ping 127.0.0.1 -w 1000 -n 5 > nul 2>&1
exit
