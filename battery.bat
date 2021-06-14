@echo off
chcp 65001
mode 20,6
cd %userprofile%
:start
echo.
ping 127.0.0.1 -n 3 > nul
powershell -command (Get-WmiObject win32_battery).estimatedChargeRemaining > akkutemp.tmp
set /p akku=<akkutemp.tmp
set /A akku=%akku%+1
del akkutemp.tmp
cls
echo You have %akku%%% left.
if %akku% EQU 100 call:100
if %akku% GEQ 80 call:80
if %akku% GEQ 60 call:60
if %akku% GEQ 40 call:40
if %akku% GEQ 20 call:20
if %akku% GEQ 5 call:5
if %akku% LSS 5 call:5


call:start

:100
echo ▄▄▄▄▄▄▄
echo █▓▓▓▓▓█▌
echo ▀▀▀▀▀▀▀
call:start
:80
echo ▄▄▄▄▄▄▄
echo █▓▓▓▓ █▌
echo ▀▀▀▀▀▀▀
call:start
:60
echo ▄▄▄▄▄▄▄
echo █▓▓▓  █▌
echo ▀▀▀▀▀▀▀
call:start
:40
echo ▄▄▄▄▄▄▄
echo █▓▓   █▌
echo ▀▀▀▀▀▀▀
call:start
:20
echo ▄▄▄▄▄▄▄
echo █▓    █▌
echo ▀▀▀▀▀▀▀
call:start
:5
echo ▄▄▄▄▄▄▄
echo █     █▌ !
echo ▀▀▀▀▀▀▀
call:start