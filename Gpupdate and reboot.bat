@echo off
rem gpupdate module by Jefferson Ritchie
rem this script checks if the netlogon service is started, changes the start type to automatic, and does a gpupdate
rem doing a gpupdate and getting the error "user and computer aren't in the same forest" can be annoying
rem ensuring the service is started in this script saves user frustration 
rem if the netlogon service doens't start automatically, it can mess with authenticating to the domain
rem Script modified to be deployed through rmm

rem asking if the user would like to reboot after the script is run
rem set /p restart="Would you like to restart after the gpupdate?  Please type (y) for yes or (n) for no (case sensitive) and hit enter "

rem ensuring the service of off so it can be configured
net stop netlogon

rem configuring the start type of the net logon service
sc.exe config netlogon start=auto

rem starting the netlogon service
net start netlogon

rem doing the gpupdate
echo n | gpupdate /force /wait:600

rem rebooting if the user chose to
rem if '%restart%' == 'y' (
	shutdown /f /r /t 0
rem ) 

rem old stuff from an earlier gpupgdate script
rem :DOTHEUPDATE
rem set /p restart="Would you like to restart this machine after the gpupdate? Please type (y) or (n) (case sensitive)  "
rem if "%restart%" == "y" (
rem 	gpupdate /force /boot 
rem	goto END
rem ) else if "%gpupdate%" == "y" (
rem 	gpupdate /force 
rem 	goto END
rem )
rem :END