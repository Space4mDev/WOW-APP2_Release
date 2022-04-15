@echo off

:: ====  setting config here  ======
set adb_cmd="..\platform-tools\adb"

echo Before start, make sure you already replace the WOW_signed.apk.

echo setp:1 connect to device...

echo setp:2 root remount...
%adb_cmd% root
%adb_cmd% remount

echo setp:3 push apk in system/priv-app
%adb_cmd% push WOW_signed.apk /system/priv-app/WOW_signed.apk

echo setp:4 chang density to 160
%adb_cmd% shell wm density 160

echo setp:5 reboot Device 
echo ====finish====
%adb_cmd% reboot

echo deploy time is %date%%time%
pause
