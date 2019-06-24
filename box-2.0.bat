@echo off
set rf=%~dp0
title 懒人工具盒
mode con cols=80 lines=30
color f0
set number=%random%%random%%random%%random%
:start
if exist %rf%lgup.off goto home-check
if exist %rf%lgup.on goto start-lgup-checks
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo 破解LGUP只出现一次，如果还想再次破解lgup可以删除在文件夹下的“lgup.off”文件。
echo -------------------------------------------------------------------------------
echo.
echo.
echo       1. 破解LGUP	^|	使用该选项请关闭脚本后以管理者运行
echo.
echo       2. 其他		^|	可刷入boot和GSI、一键禁用、切换ab分区等
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "请选择" /c 12
echo poweredbyheizi>lgup.off
if %errorlevel%==1 goto start-lgup-check
if %errorlevel%==2 goto home-check
goto end
goto end-wrong
:start-lgup-check
del %rf%lgup.off
@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo -------------------------------------------------------------------------------
echo 正在请求管理员权限...
echo -------------------------------------------------------------------------------
echo 本脚本修改自https://forum.xda-developers.com/android/general/tecknights-aristo-2-tutorials-t3805141/page3
echo -------------------------------------------------------------------------------
echo poweredbyheizi>%rf%lgup.on
goto UACPrompt
) else ( goto start-lgup-checks )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:start-lgup-checks
del %rf%lgup.on
echo 检查LGUP安装状态中……
echo -------------------------------------------------------------------------------
if exist "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe" (
echo 成功
echo -------------------------------------------------------------------------------
goto start-lgup-checkses
) else (
rem 大佬，看到这里一定要去Gitub帮我改了，谢了。由于执行错误我把括号都删了，改成正和反代替。
  rem echo 失败
  rem echo -------------------------------------------------------------------------------
  rem echo 重新定向中
  rem echo -------------------------------------------------------------------------------
  rem set "ProgramFiles正x86反"="C:\Program Files 正x86反"
	  rem echo " %ProgramFiles正x86反%\LG Electronics\LGUP\LGUP.exe "
      rem if exist "%ProgramFiles正x86反%\LG Electronics\LGUP\LGUP.exe" 正A
	  rem echo "%ProgramFiles正x86反\LG Electronics\LGUP\LGUP.exe"
      rem echo 定向成功
      rem echo -------------------------------------------------------------------------------
      rem goto start-lgup-checkses
      rem 反A else 正B
        echo ！错误！未检测到LGUP！正在跳转至帮助页面……
        echo -------------------------------------------------------------------------------
        %rf%file\other\help.url
        goto lgup-end-error
		rem 反B 
)
:start-lgup-checkses
echo 检查LGUP备份状态中……
echo -------------------------------------------------------------------------------
if exist "%rf%file\lgup\LGUPR.exe" (
echo 存在，正在为您跳过备份。
echo -------------------------------------------------------------------------------
goto start-lgup
) else (
echo 不存在，备份中
echo -------------------------------------------------------------------------------
copy "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"  "%rf%file\lgup\LGUPR.exe"
if not errorlevel 1 goto start-lgup
echo ！错误！备份失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
:start-lgup
echo poweredbyheizi>%rf%lgup.off
title 懒人工具盒 - 破解LGUP
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo       1. 破解LGUP
echo.
echo.
echo.
echo       2. 还原LGUP
echo.
echo.
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "请选择" /c 12
if %errorlevel%==1 goto setdev
if %errorlevel%==2 goto setrec
:setdev
title 懒人工具盒 - 破解LGUP - 破解模式
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo 创建Common文件夹，并修改DLL中……
if not exist "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\" md "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
if not errorlevel 1 ( 
echo ！错误！修改失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.u
goto lgup-end-error
)
copy /Y "%rf%file\lgup\LGUP_CommonD.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
echo -------------------------------------------------------------------------------
echo 修改LGUP中……
copy "%rf%file\lgup\LGUPD.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if errorlevel 1 ( 
echo ！错误！修改失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo 完成
echo -------------------------------------------------------------------------------
goto lgup-end
:setrec
title 懒人工具盒 - 破解LGUP - 恢复模式
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo 删除Common文件夹、DLL中……
del "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
rd "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
if errorlevel 1 ( 
echo ！错误！修改失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo 修改LGUP中……
copy "%rf%file\lgup\LGUPR.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if errorlevel 1 ( 
echo ！错误！修改失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo 完成
echo -------------------------------------------------------------------------------
goto lgup-end
:lgup-end-error
title 错误！
echo 清理状态中
if exist %rf%lgup.off del %rf%lgup.off
if exist %rf%lgup.on del %rf%lgup.on
echo -------------------------------------------------------------------------------
:lgup-end
set /p poweredbyheizi=点击任意键退出脚本
exit /B 
:home-check
title 懒人工具盒 - 检测文件 adb 
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo 检查adb.exe是否存在中……
echo -------------------------------------------------------------------------------
if not exist "%rf%\file\adb\adb.exe" (
echo ！错误！未检测到adb！请关闭程序把解压包解压到别的地方再启动本程序试试，如果不行请重新定向adb.exe，将任意的adb.exe拖入本程序窗口内后 按下回车键确认。
echo -------------------------------------------------------------------------------
set /p adb= 
) else (
echo 成功找到adb.exe
set adb=%rf%file\adb\adb.exe
echo -------------------------------------------------------------------------------
)
title 懒人工具盒 - 检测文件 fastboot
echo 检查fastboot.exe是否存在中……
echo -------------------------------------------------------------------------------
if not exist "%rf%\file\adb\fastboot.exe" (
echo ！错误！未检测到fastboot！请关闭程序把解压包解压到别的地方再启动本程序试试，如果不行请重新定向fastboot.exe，将任意的fastboot.exe拖入本程序窗口内后 按下回车键确认。
echo -------------------------------------------------------------------------------
set /p fastboot= 
)
echo 成功找到fastboot.exe
set fastboot=%rf%file\adb\fastboot.exe
echo -------------------------------------------------------------------------------
echo 初始化adb中
echo -------------------------------------------------------------------------------
::%adb% kill-server
::%adb% start-server
echo -------------------------------------------------------------------------------

:home 
title 懒人工具盒 
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo 破解LGUP只出现一次，如果还想再次破解lgup可以删除在文件夹下的“lgup.off”文件。
echo -------------------------------------------------------------------------------
echo.
echo.
echo       1. 一键式优化官方系统 ^（禁用系统应用、时间同步、隐藏导航栏、重启。^）
echo.
echo       2. 刷入BOOT         3. 切换AB分区
echo.
echo       4. 刷入GSI          9. 高级菜单
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "请选择" /c 12349
if %errorlevel%==1 set mode=stock
if %errorlevel%==2 set mode=boot
if %errorlevel%==3 set mode=slot
if %errorlevel%==4 set mode=GSI
if %errorlevel%==5 goto hide
cls
title 懒人工具盒 
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
if mode=stock goto adb-devices
:fastboot-devices
if exist "%rf%0" del 0
for /f %%i in ('%fastboot% devices -l') do echo %%i>0
if not exist 0 (
set /p  poweredbyheizi=等待设备中……请将您的设备重启到fastboot模式后按任意键继续……
echo -------------------------------------------------------------------------------
%fastboot% devices
goto fastboot-devices
) else (
for /f %%i in (0) do set device=%%i 
del 0
)
echo 检测到设备"%device%" 
echo -------------------------------------------------------------------------------
if mode=boot goto flash-boot
if mode=slot goto slot-active
if mode=GSI goto GSI-flasher
goto end-wrong
:adb-devices
echo 等待设备中……请将您的设备插入电脑……
echo -------------------------------------------------------------------------------
%adb% wait-for-device
for /f %%i in ('adb devices') do set device=%%i
echo 检测到设备"%device%" 
goto end-wrong
echo -------------------------------------------------------------------------------
if mode=stock goto adb-devices
goto end-wrong
:hide
title 懒人工具盒 - 高级模式
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo 如你所见，这里非常geek！
echo -------------------------------ADB-分区----------------------------------------
echo.
echo 		1.时间同步		2.隐藏导航栏		3.禁用软件		4.ADB重启
echo.
echo -------------------------------TWRP-分区---------------------------------------
echo.
echo 				1.无限TWRP循环				2.线刷ZIP包
echo.
echo -----------------------------Fastboot-分区-------------------------------------
echo.
echo 			1.切换系统槽	2.刷入任意分区	3.清空用户数据
echo.
echo -------------------------------------------------------------------------------
choice /m "请选择分区 ^(ADB/TWRP/Fastboot^)" /c ATF
if %errorlevel%==1 goto path-a
if %errorlevel%==2 goto path-t
if %errorlevel%==3 goto path-f
echo -------------------------------------------------------------------------------
:path-a
choice /m "请选择指令" /c 1234
if %errorlevel%==1 goto
if %errorlevel%==2 goto
if %errorlevel%==3 goto
if %errorlevel%==4 goto
:path-t
choice /m "请选择指令" /c 1234
if %errorlevel%==1 goto
if %errorlevel%==2 goto
if %errorlevel%==3 goto
if %errorlevel%==4 goto
:path-f
choice /m "请选择指令" /c 1234
if %errorlevel%==1 goto
if %errorlevel%==2 goto
if %errorlevel%==3 goto
if %errorlevel%==4 goto


goto end
goto end-wrong

:end-wrong
set /p poweredbyheizi=你掉进了世界!给黑字提交这个bug吧！
goto edddddddddd
:end
set /p poweredbyheizi=执行完成,按任意键返回主页。
goto home