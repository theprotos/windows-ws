# bin

Includes executable files and DLLs

### config.ini

List of variables for actuall build process

example:
```
scriptInitial=initial-config.bat
scriptPower=power-config.bat
scriptAppsInstall=choco-install.bat
scriptAppsUpdate=choco-update.bat
scriptTools=tools-install.bat
scriptTimeUpdate=time-update.bat
scriptStartMenu=script\start-menu.bat
taskName=user\UpdateApps
taskTimeName=user\UpdateTime
startLayout=config\LayoutModification.xml
stringStyle=###############
```

### Office32.xml and Office64.xml

Includes products set and languages for respective Office arch

### WICleanupC.EXE

**Run the app at your own risk**. This is not safe application, it removes files from `%windir%\Installer` directory.
