
@echo off
title LAF杀手
mode con cols=80 lines=30
color f0
set rf=%~dp0
set number=%random%%random%_%time%
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
set adb="%rf%adb\adb.exe"
echo -------------------------------------------------------------------------------
goto home
:r-a
echo -------------------------------------------------------------------------------
echo 请自己准备的adb.exe拖入本窗口内，没有请关闭。
set /p adb= 
:home
%adb% kill-server
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
echo 	检查root权限，请留意手机内的权限申请。
%adb% shell "su -c 'echo %number%'"
echo -------------------------------------------------------------------------------
echo 	正在备份laf_a和laf_b到手机/sdcard/Download/lafBackup/中……
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/laf_a of=/sdcard/Download/lafBackup/laf_a_%number%.img'"
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/laf_b of=/sdcard/Download/lafBackup/laf_b_%number%.img'"
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
choice /m "请选择操作" /c 12456
set number=%random%%random%_%date%%time%
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo 注意: 请确保您的LG设备安装有Magisk并打开USB调试后连接电脑。
echo -------------------------------------------------------------------------------
echo 目前已经识别到的设备有:
%adb% devices
echo -------------------------------------------------------------------------------
echo 	检查root权限，请留意手机内的权限申请。
%adb% shell "su -c 'echo %number%'"
echo -------------------------------------------------------------------------------
if %errorlevel%==1 (
set laf=laf_a
goto laf-backup
)
if %errorlevel%==2 goto laf_b-backup
if %errorlevel%==3 goto laf_a-delete
if %errorlevel%==4 goto laf_b-delete
if %errorlevel%==5 goto laf_a-restore
if %errorlevel%==6 goto laf_b-restore
goto end
goto end-wrong
:laf-backup
echo 	正在备份%laf%手机/sdcard/Download/lafBackup/中……
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/%laf% of=/sdcard/Download/lafBackup/%laf%_%number%.img'"
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

:laf_a-backup
echo 	正在备份laf_a手机/sdcard/Download/lafBackup/中……
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/laf_a of=/sdcard/Download/lafBackup/laf_a_%number%.img'"
echo -------------------------------------------------------------------------------
echo 	正在复制备份文件到文件脚本目录lafBackup文件夹里……
%adb% pull /sdcard/Download/lafBackup/laf_a_%number%.img %rf%lafBackup\laf_a_%number%.img
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_b-backup
echo 	正在备份laf_b手机/sdcard/Download/lafBackup/中……
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/laf_b of=/sdcard/Download/lafBackup/laf_b_%number%.img'"
echo -------------------------------------------------------------------------------
echo 	正在复制备份文件到文件脚本目录lafBackup文件夹里……
%adb% pull /sdcard/Download/lafBackup/laf_b_%number%.img %rf%lafBackup\laf_b_%number%.img
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_a-delete
echo 	正在删除laf_a……
%adb% shell "su -c 'dd if=/dev/zero of=/sdcard/laf_a bs=512 count=98304 '"
%adb% shell "su -c 'dd if=/sdcard/laf_a of=/dev/block/bootdevice/by-name/laf_a bs=512 count=98304 '"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_b-delete
echo 	正在删除laf_b……
%adb% shell "su -c 'dd if=/dev/zero of=/sdcard/laf_b bs=512 count=98304 '"
%adb% shell "su -c 'dd if=/sdcard/laf_b of=/dev/block/bootdevice/by-name/laf_b bs=512 count=98304 '"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_a-restore
echo 	请将要写入的laf_a文件拖入该窗口，本程序的备份文件在lafBackup文件夹内。
set /p lafaf=
%adb% push %lafaf% /sdcard/laf_a
%adb% shell "su -c 'dd if=/sdcard/laf_a of=/dev/block/bootdevice/by-name/laf_a'"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_b-restore
echo 	请将要写入的laf_b文件拖入该窗口，本程序的备份文件在lafBackup文件夹内。
set /p lafbf=
%adb% push %lafbf% /sdcard/laf_b
%adb% shell "su -c 'dd if=/sdcard/laf_b of=/dev/block/bootdevice/by-name/laf_b'"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong

set /p powerbyheizi=神奇BUG,提交后可获得一包七个小矮人。
::test-backuplaf-and-change
set /p powerbyheizi=神奇BUG,提交后可获得一包七个小矮人。
::我想做一个灵活切换Laf_a Laf_b的
goto end-wrong
:end-wrong
set /p powerbyheizi=神奇BUG,提交后可获得一包七个小矮人。
:end
set /p powerbyheizi=执行完成,按任意键返回主页。
goto home