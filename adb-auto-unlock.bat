echo this file is batch command file
@ echo off
cls
set rf=%~dp0
title auto unlock bootloader
mode con cols=80 lines=30

set roootedBoot=./*.img
if not exist %rf%/adb.exe (
  echo have no adb.exe on %rf%
	goto end ) else (
	adb kill-server
	adb start-server )

if not exist %rf%/fastboot.exe (
  echo have no fastboot.exe on %rf%
	goto end )



:main
if not exist "%rf%/status" echo main >status
cls
echo.
echo.
echo 			make by heizi
echo.
echo      1.start unlock bootloader 
echo.
echo      2.continue the step of last u do
echo.
echo      3.choice a step
echo.     

set /p mainChoice=
if "%mainChoice%"=="1" goto startANew
if "%mainChoice%"=="2" goto continueStep
if "%mainChoice%"=="3" goto anyway
goto endByBug
goto end

:startANew
pause
goto step1
goto end

:continueStep
:: for shit in `cat status`;do goto step$shit ;done

goto end
:anyway
cls
echo。
echo.
echo     choice a step
echo.
echo.
set /p i=
:: for i < 6
::      echo type<6
::      set /p i=

goto step%i%



goto end
:step1
echo 0 >status
echo.
echo reboot to fastboot right now or press any key if ure already in the fastboot.
adb reboot bootloader
echo.
pause
echo.
fastboot boot %rootedBoot%
echo.
echo 1 >status
goto step2

goto end

:step2
echo.
echo open usb debug and change the to just charging that what way your phone connent to PC
echo.
pause
adb devices
adb push abl_a /sdcard/abl_a
echo 2>status

: step3
echo.
echo open the FULL version magisk manager and dont update or deploy or something ,just make shell runing on root ,press any key to keep go on.
set /p powerdByHeizi=
echo.
adb shell su -c hello world
adb shell su -c if=/dev/block/bootdevice/by-name/abl_a of=/sdcard/abl_backup
adb pull /sdcard/abl_backup abl_backup
adb shell su -c dd if=/sdcard/abl_a of=/dev/block/bootdevice/by-name/abl_a
adb reboot bootloader
echo 3>status

:step4
echo.
echo make sure your phone booted to fastboot , fastboot UI look like big green reboot and yellow _a_b and black background or something.
echo.
pause
echo fastboot oem unlock
fastboot oem unlock
echo.
echo if its success then keep go on or post screenshot to whatever community if your get the fall
echo 4>status
pause

:step5
echo.
echo this is last step to setup env and try again this step if your phone cant reboot to the android.
echo.
pause
fastboot flash boot_a %rootedBoot%
fastboot flash boot_b %rootedBoot%
fastboot flash abl_a abl_backup

echo 5>status


goto end

:endByBug
echo    end by bug

:end
echo    press any key to shutdown this script
set /p powerdByHeizi=
