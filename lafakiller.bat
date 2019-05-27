@echo off
title="Laf杀手"
color f0
set rf=%~dp0
:check-exist-adb.exe
echo 检查adb.exe是否存在中……
if not exist "%rf%adb\adb.exe" (
echo.
echo 错误:
echo 未找到adb.exe，请下载完整包。
goto r-a
) 
echo 成功找到adb.exe
set adb="%rf%adb\adb.exe"
goto home
:r-a
echo 请将adb.exe拖入本窗口内
set /p adb= 
:home
%adb% kill-server
set number=%random%%random%_%time%
cls
echo PowerBy-HEIZI %number%
echo 注意: 请确保您的LG设备安装有Magisk并打开USB调试后连接电脑。
echo.
echo 目前已经识别到的设备有:
%adb% devices
echo 请选择
echo 1.默认模式^(备份^+删除laf_a^)
echo 2.高级模式^(可自行选择撒A还是撒B^)



:end
set /p powerbyheizi=执行完成
goto home