@echo off
title LAF杀手
mode con cols=80 lines=30
color f0
set rf=%~dp0
set number=%random%%random%%random%%random%
%rf%other/1.jpg
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
:check-exist-adb.exe
echo 检查adb.exe是否存在中……
echo -------------------------------------------------------------------------------
if not exist "%rf%adb\adb.exe" (
echo 错误:
echo 未在目录下找到adb.exe，请下载完整包或重新定向adb.exe。
goto r-a
) 
echo 成功找到adb.exe
:: set adb=echo
set adb=%rf%adb\adb.exe
echo -------------------------------------------------------------------------------
goto pre-home
:r-a
echo -------------------------------------------------------------------------------
echo 请自己准备的adb.exe拖入本窗口内，没有请关闭。
set /p adb= 
echo -------------------------------------------------------------------------------
:pre-home
echo 	初始化adb中
%adb% kill-server
%adb% start-server
echo -------------------------------------------------------------------------------
:home
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo 注意: 请确保您的LG设备安装有Magisk并打开USB调试后连接电脑。
echo -------------------------------------------------------------------------------
echo 目前已经识别到的设备有:
%adb% wait-for-device
%adb% devices
echo -------------------------------------------------------------------------------
echo.
echo.
echo 	1. 默认模式^(备份^+删除laf_a^)
echo.
echo 	2. 高级模式^(可自行选择三天之内你撒A还是杀B^)
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "请选择模式(三秒后自动跳转默认)" /c 12 /d 1 /t 0005
if %errorlevel%==1 goto easymode
if %errorlevel%==2 goto hardmode
goto end
goto end-wrong
:easymode
title LAF杀手 -默认模式
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo 注意: 请确保您的LG设备安装有Magisk并打开USB调试后连接电脑。
echo -------------------------------------------------------------------------------
echo 	检查root权限中……请留意手机内的权限申请。
for /f %%i in ('%adb% shell "su -c 'echo success'"') do set suckess=%%i 
if not %suckess%==success (
echo 	获取Root权限失败，请进入MagiskManager给予Shell Root权限后按回车键继续。
echo 	没有Magisk请退出^(废话^)
set /p powerbyheizi= 
 for /f %%i in ('%adb% shell "su -c 'echo success'"') do set suckess=%%i 
 if not %suckess%==success ( 
 echo 	你还是没有授权Root权限，再见。
 echo -------------------------------------------------------------------------------
 goto end
 )
)
echo 	获取Root权限成功
echo -------------------------------------------------------------------------------
echo 	正在备份laf_a和laf_b到手机/sdcard/Download/lafBackup/中……
%adb% shell mkdir /sdcard/Download/lafBackup/
%adb% shell "su -c 'cp /dev/block/bootdevice/by-name/laf_a /sdcard/Download/lafBackup/laf_a_%number%.img'"
%adb% shell "su -c 'cp /dev/block/bootdevice/by-name/laf_b /sdcard/Download/lafBackup/laf_b_%number%.img'"
echo -------------------------------------------------------------------------------
echo 	正在复制备份文件到文件脚本目录lafBackup文件夹里……
%adb% pull /sdcard/Download/lafBackup/laf_a_%number%.img %rf%lafBackup\laf_a_%number%.img
%adb% pull /sdcard/Download/lafBackup/laf_b_%number%.img %rf%lafBackup\laf_b_%number%.img
echo -------------------------------------------------------------------------------
echo 	正在删除laf_a……
%adb% shell "su -c 'dd if=/dev/zero of=/sdcard/laf_a bs=512 count=98304 '"
%adb% shell "su -c 'dd if=/sdcard/laf_a of=/dev/block/bootdevice/by-name/laf_a bs=512 count=98304 '"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:hardmode
set number=%random%%random%%random%%random%
title LAF杀手 -高级模式
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo 注意: 请确保您的LG设备安装有Magisk并打开USB调试后连接电脑。
echo -------------------------------------------------------------------------------
echo 目前已经识别到的设备有:
%adb% devices
echo -------------------------------------------------------------------------------
echo.
echo.
echo       1. 备份laf_a      2. 备份laf_b
echo.
echo       3. 删除laf_a      4. 删除laf_b
echo.
echo       5. 写入laf_a      6. 写入laf_b
echo.
echo.
echo -------------------------------------------------------------------------------
set /p mode=请选择操作 ^[1,2,3,4,5,6^]

cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo 注意: 请确保您的LG设备安装有Magisk并打开USB调试后连接电脑。
echo -------------------------------------------------------------------------------
echo 目前已经识别到的设备有:
%adb% devices
echo -------------------------------------------------------------------------------
echo 	检查root权限中……请留意手机内的权限申请。
for /f %%i in ('%adb% shell "su -c 'echo success'"') do set suckess=%%i 
if not %suckess%==success (
echo 	获取Root权限失败，请进入MagiskManager给予Shell Root权限后再打开该程序。
set /p powerbyheizi=看不懂上面我在说啥请自杀，按任意键立即自杀^(指立即退出程序^)。
goto endd
  )
echo 	获取Root权限成功
echo -------------------------------------------------------------------------------
if %mode%==1 (
set laf=laf_a
goto laf-backup
)

if %mode%==2 (
set laf=laf_b
goto laf-backup
)

if %mode%==3 (
set laf=laf_a
goto laf-delete
)

if %mode%==4 (
set laf=laf_b
goto laf-delete
)

if %mode%==5 (
set laf=laf_a
goto laf-restore
)

if %mode%==6 (
set laf=laf_b
goto laf-restore
)
goto end
goto end-wrong
:laf-backup
echo 	正在备份%laf%手机/sdcard/Download/lafBackup/中……
%adb% shell mkdir /sdcard/Download/lafBackup/
%adb% shell "su -c 'dd if=/dev/block/bootdevice/by-name/%laf% of=/sdcard/Download/lafBackup/%laf%_%number%.img'"
echo -------------------------------------------------------------------------------
echo 	正在复制备份文件到文件脚本目录lafBackup文件夹里……
%adb% pull /sdcard/Download/lafBackup/%laf%_%number%.img %rf%lafBackup\%laf%_%number%.img
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf-delete
echo 	正在删除%laf%……
%adb% shell "su -c 'dd if=/dev/zero of=/sdcard/%laf% bs=512 count=98304 '"
%adb% shell "su -c 'dd if=/sdcard/%laf% of=/dev/block/bootdevice/by-name/%laf% bs=512 count=98304 '"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf-restore
echo 	请将要写入的%laf%文件拖入该窗口，本程序的备份文件在lafBackup文件夹内。
set /p lafaf=
%adb% push %lafaf% /sdcard/%laf%
%adb% shell "su -c 'dd if=/sdcard/%laf% of=/dev/block/bootdevice/by-name/%laf%'"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
goto end-wrong
:end-wrong
set /p powerbyheizi=神奇BUG,提交后可获得一包七个小矮人。
:end
set /p powerbyheizi=执行完成,按任意键返回主页。
goto home
goto home
goto home
goto home
goto home
goto home