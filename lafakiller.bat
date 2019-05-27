@echo off
title LAF杀手
mode con cols=80 lines=30
color f0
set rf=%~dp0
set number=%random%%random%_%time%
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
:check-exist-adb.exe
echo 检查adb.exe是否存在中……
echo -------------------------------------------------------------------------------
if not exist "%rf%adb\adb.exe" (
echo 错误:
echo 未找到adb.exe，请下载完整包。
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
echo 1. 默认模式^(备份^+删除laf_a^)
echo 2. 高级模式^(可自行选择三天之内你撒A还是杀B^)
echo -------------------------------------------------------------------------------
choice /m "请选择模式(三秒后自动跳转默认)" /c 12 /d 1 /t 0003
if %errorlevel%==1 goto easymode
if %errorlevel%==2 goto hardmode
:easymode
title LAF杀手 -默认模式
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo 注意: 请确保您的LG设备安装有Magisk并打开USB调试后连接电脑。
echo -------------------------------------------------------------------------------
echo 检查root权限，请留意手机内的权限申请。
echo -------------------------------------------------------------------------------
echo 正在备份laf_a和laf_b到手机/sdcard/Download/lafBackup/中……
echo -------------------------------------------------------------------------------
echo 正在复制备份文件到文件脚本目录lafBackup文件夹里……
echo -------------------------------------------------------------------------------
echo 正在删除laf_a……
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