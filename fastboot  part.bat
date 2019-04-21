@echo off
mode con: cols=50 lines=40
color 70
set rf=%~dp0


:check
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================

if not exist "%rf%\pt\adb.exe" (
echo.
echo 错误:
echo 未找到adb.exe，请下载完整包。
) else (
echo 成功找到adb.exe
set adb="%rf%\pt\adb.exe")
if not exist "%rf%\pt\fastboot.exe" (
echo.
echo 错误:
echo 未找到fastboot.exe，请下载完整包。
goto aname
) else (
echo 成功找到fastboot.exe
set fastboot="%rf%\pt\fastboot.exe"
goto start)

:aname
echo 如果你有adb工具包请输入A，没有则关闭本窗口。
set /p check=
if check==A goto ref

:ref
echo 请将adb.exe拖入本窗口内
set /p adb=
echo 请将fastboot.exe拖入本窗口内
set /p fastboot= 

:start
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================
echo 未发行版本
echo 传出去的NMSL
echo 刷boot1、切换分区2、刷gsi3 、
set /p mode=^(1-3^)
if %mode%==1 goto flash-boot
if %mode%==2 goto ActiveSLOT
if %mode%==3 goto Flash-GSI


:flash-boot
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================

echo 开启刷boot模式
echo 请把要刷的boot.img拖进本窗口
set /p bootfile=
echo 正在刷入boot_a
echo on
%fastboot% flash boot_a %bootfile%
@echo 正在刷入boot_b
%fastboot% flash boot_b %bootfile%
@echo off
echo.
echo 如果有问题请截图再问
goto end

:ActiveSLOT
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================
echo 你要激活哪个分区？
choice /c ab
if %errorlevel%==1 %fastboot% --set-active=a
if %errorlevel%==2 %fastboot% --set-active=b
echo 完成
echo 是否重启？
choice /c yn
if %errorlevel%==1 %fastboot% reboot
if %errorlevel%==2 goto end
goto end

:Flash-GSI
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================
echo 开启刷GSI模式
echo =============
echo 1.只刷System分区
echo 2.只刷Vendor分区
echo 3.上面俩我全都要(推荐)
set /p svbm=^(1-3^)%=%
if %svbm%==1 goto flash-gsi-boot
if %svbm%==2 goto flash-gsi-boot
if %svbm%==3 goto flash-gsi-boot


:flash-gsi-boot
echo ==================================================
echo 请把要刷的boot.img拖进本窗口
echo ==================================================
set /p bootfile=
echo 正在刷入boot_a
echo on
%fastboot%  --set-active=a flash boot_a %bootfile%
@echo off
echo ==================================================
goto flash-vbmeta


:flash-vbmeta 
echo 请把要刷的vbmeta.img拖进本窗口
echo ==================================================
set /p vbmetafile=
echo 正在刷入vbmeta
echo on
%fastboot%  --disable-verity --disable-verification flash vbmeta_a %vbmetafile%
@echo off
echo ==================================================
if %svbm%==1 goto flash-system
if %svbm%==2 goto flash-vandor
if %svbm%==3 goto flash-vandor

:flash-vandor
echo 请把要刷的vandor.img拖进本窗口
echo ==================================================
set /p vendorfile=
echo 正在刷入vandor
echo on
%fastboot%  --disable-verity --disable-verification flash vendor_a %vendorfile%
@echo off
echo ==================================================
if %svbm%==2 goto end
if %svbm%==3 goto flash-system
:flash-system
echo 请把要刷的system.img拖进本窗口
echo ==================================================
set /p systemfile=
echo 正在刷入system
echo on
%fastboot%  --disable-verity --disable-verification flash system_a %systemfile%
@echo off
echo ==================================================
goto end







:end
echo ==================================================
echo 指令执行完成
set /p=按任意键退出