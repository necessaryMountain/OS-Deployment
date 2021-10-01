@echo off
rem This script just does a gpupdate and forces a reboot.  It inputs a no when gpupdate asks to restart so a reboot can be forced.
rem doing the gpupdate
echo n | gpupdate /force /wait:600

shutdown /f /r /t 0
