@echo off

:: ====  setting config here  ======
set adb_cmd="..\platform-tools\adb"

echo Before start, make sure you already replace the WOW_signed.apk.
set /p ip_addr="please Enter default ip: "
echo your ip_addr is %ip_addr%

echo setp:1 connect to device...
%adb_cmd% disconnect
%adb_cmd% connect %ip_addr%

echo setp:2 root remount...
%adb_cmd% root
%adb_cmd% connect %ip_addr%
%adb_cmd% remount
%adb_cmd% connect %ip_addr%

echo setp:3 push apk in system/priv-app
%adb_cmd% -s %ip_addr% shell rm /system/priv-app/WOW_signed/*

echo setp:4 push apk in system/priv-app
%adb_cmd% -s %ip_addr% push WOW_signed.apk /system/priv-app/WOW_signed/WOW_signed.apk

echo setp:5 chang density to 160
%adb_cmd% -s %ip_addr% shell wm density 160

echo setp:6 reboot Device 
echo ====finish====
%adb_cmd% -s %ip_addr% reboot

echo deploy time is %date%%time%
pause
