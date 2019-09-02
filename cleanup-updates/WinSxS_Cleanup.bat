Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
Dism.exe /online /Cleanup-Image /StartComponentCleanup
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
Dism.exe /online /Cleanup-Image /SPSuperseded
cleanmgr.exe /force full
PAUSE
