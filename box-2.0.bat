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
echo       4. 刷入GSI          9. 高级模式
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
if %mode%==stock goto adb-devices
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
if %mode%==boot goto flash-boot
if %mode%==slot goto slot-active
if %mode%==GSI goto GSI-flasher
goto end-wrong
:adb-devices
echo 等待设备中……请将您的设备插入电脑……
echo -------------------------------------------------------------------------------
::%adb% wait-for-device
for /f %%i in ('adb devices') do set device=%%i
echo 检测到设备"%device%" 
echo -------------------------------------------------------------------------------
if %mode%==stock goto adb-ntps
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
:adb-hide

:adb-ntps
if %mode%==stock ( title 懒人工具盒 - 一键式优化官方系统 - 时间同步 ) else ( title 懒人工具盒 - 时间同步 )
echo 时间同步
echo -------------------------------------------------------------------------------
if %mode%==stock (
	choice /m "	要执行时间同步吗？^(执行/不执行^)" /c dn
	echo -------------------------------------------------------------------------------
	) else (
		set errorlevel=3
		%adb% shell settings put global ntp_server ntp1.aliyun.com
		echo 	执行完成
		echo -------------------------------------------------------------------------------
		goto end
)
if %errorlevel%==3 goto end
if %errorlevel%==1 (
	echo 	执行中…………
	echo -------------------------------------------------------------------------------
	%adb% shell settings put global ntp_server ntp1.aliyun.com
	echo 	执行完成
	echo -------------------------------------------------------------------------------
	goto adb-shitappkiller
	)
if %errorlevel%==2 (
	echo 	正在跳过
	echo -------------------------------------------------------------------------------
	goto adb-shitappkiller
	)
:adb-shitappkiller
if %mode%==stock ( title 懒人工具盒 - 一键式优化官方系统 - 禁用系统应用 ) else ( title 懒人工具盒 - 禁用系统应用)
echo 禁用系统应用
echo -------------------------------------------------------------------------------
echo.
echo.
if %mode%==stock ( 
choice /m "	要冻结还是解冻还是跳过？^(冻结/解冻/跳过^)" /c FUN
echo.
echo.
echo -------------------------------------------------------------------------------
) else (
choice /m "	^(冻结/解冻^)" /c DJ
echo -------------------------------------------------------------------------------
)
if %errorlevel%==1 set frozen=disable-user
if %errorlevel%==2 set frozen=enable
if %errorlevel%==3 (
echo 正在跳过
echo -------------------------------------------------------------------------------
goto adb-navbar
)
%adb% shell pm %frozen% com.lge.quicktools
%adb% shell pm %frozen% com.lge.clock
%adb% shell pm %frozen% com.lge.hifirecorder
%adb% shell pm %frozen% com.lge.cic.eden.service
%adb% shell pm %frozen% com.lge.provider.yellowpage
%adb% shell pm %frozen% com.lge.cnas.main
%adb% shell pm %frozen% com.lge.cnas.terms
%adb% shell pm %frozen% com.lge.iuc
%adb% shell pm %frozen% com.lge.lms
%adb% shell pm %frozen% com.lge.qlens
%adb% shell pm %frozen% com.lge.eulaprovider
%adb% shell pm %frozen% com.lge.eula
%adb% shell pm %frozen% com.lge.floatingbar
%adb% shell pm %frozen% com.lge.cinemagraph
%adb% shell pm %frozen% com.lguplus.oemsearch
%adb% shell pm %frozen% com.lge.updatecenter
%adb% shell pm %frozen% com.lge.lgassistant
%adb% shell pm %frozen% com.lguplus.mobile.cs
%adb% shell pm %frozen% com.skt.skaf.OA00018282
%adb% shell pm %frozen% com.lguplus.appstore
%adb% shell pm %frozen% com.lge.lgpay
%adb% shell pm %frozen% com.android.bips
%adb% shell pm %frozen% com.lge.lgassistant
%adb% shell pm %frozen% com.android.bookmarkprovider
%adb% shell pm %frozen% com.android.calendar
%adb% shell pm %frozen% com.android.calllogbackup
%adb% shell pm %frozen% com.android.chrome
%adb% shell pm %frozen% com.android.egg
%adb% shell pm %frozen% com.android.emergency
%adb% shell pm %frozen% com.android.hotwordenrollment.okgoogle
%adb% shell pm %frozen% com.android.hotwordenrollment.tgoogle
%adb% shell pm %frozen% com.android.hotwordenrollment.xgoogle
%adb% shell pm %frozen% com.android.printspooler
%adb% shell pm %frozen% com.android.providers.partnerbookmarks
%adb% shell pm %frozen% com.crucialsoft.asm
%adb% shell pm %frozen% com.crucialsoft.fido.client
%adb% shell pm %frozen% com.crucialtec.uaf
%adb% shell pm %frozen% com.facebook.appmanager
%adb% shell pm %frozen% com.facebook.system
%adb% shell pm %frozen% com.google.android.apps.docs
%adb% shell pm %frozen% com.google.android.apps.docs.editors.docs
%adb% shell pm %frozen% com.google.android.apps.docs.editors.sheets
%adb% shell pm %frozen% com.google.android.apps.docs.editors.slides
%adb% shell pm %frozen% com.google.android.apps.maps
%adb% shell pm %frozen% com.google.android.apps.photos
%adb% shell pm %frozen% com.google.android.apps.tachyon
%adb% shell pm %frozen% com.google.android.calculator
%adb% shell pm %frozen% com.google.android.configupdater
%adb% shell pm %frozen% com.google.android.gm
%adb% shell pm %frozen% com.google.android.googlequicksearchbox
%adb% shell pm %frozen% com.google.android.ims
%adb% shell pm %frozen% com.google.android.marvin.talkback
%adb% shell pm %frozen% com.google.android.music
%adb% shell pm %frozen% com.google.android.onetimeinitializer
%adb% shell pm %frozen% com.google.android.partnersetup
%adb% shell pm %frozen% com.google.android.printservice.recommendation
%adb% shell pm %frozen% com.google.android.tts
%adb% shell pm %frozen% com.google.android.videos
%adb% shell pm %frozen% com.google.android.youtube
%adb% shell pm %frozen% com.google.ar.core
%adb% shell pm %frozen% com.google.ar.lens
%adb% shell pm %frozen% com.ipsec.profile
%adb% shell pm %frozen% com.lge.bnr
%adb% shell pm %frozen% com.lge.bnr.launcher
%adb% shell pm %frozen% com.lge.briefing
%adb% shell pm %frozen% com.lge.cloudhub
%adb% shell pm %frozen% com.lge.exchange
%adb% shell pm %frozen% com.lge.gallery.collagewallpaper
%adb% shell pm %frozen% com.lge.gallery.vr.wallpaper
%adb% shell pm %frozen% com.lge.ia.task.smartsetting
%adb% shell pm %frozen% com.lge.iftttmanager
%adb% shell pm %frozen% com.lge.leccp
%adb% shell pm %frozen% com.lge.lgaccount
%adb% shell pm %frozen% com.lge.lgmapui
%adb% shell pm %frozen% com.lge.lifetracker
%adb% shell pm %frozen% com.lge.livewallpaper.multiphoto
%adb% shell pm %frozen% com.lge.mirroringhead
%adb% shell pm %frozen% com.lge.myplace
%adb% shell pm %frozen% com.lge.myplace.engine
%adb% shell pm %frozen% com.lge.qhelp
%adb% shell pm %frozen% com.lge.qhelp.application
%adb% shell pm %frozen% com.lge.remote.lgairdrive
%adb% shell pm %frozen% com.lge.remote.setting
%adb% shell pm %frozen% com.lge.smartshare
%adb% shell pm %frozen% com.lge.smartshare.provider
%adb% shell pm %frozen% com.lge.smartsharepush
%adb% shell pm %frozen% com.lge.smartsuggestion
%adb% shell pm %frozen% com.lge.sync
%adb% shell pm %frozen% com.lge.task
%adb% shell pm %frozen% com.lge.touchcontrol
%adb% shell pm %frozen% com.lge.video.vr.wallpaper
%adb% shell pm %frozen% com.lge.videostudio
%adb% shell pm %frozen% com.lge.vrplayer
%adb% shell pm %frozen% com.rsupport.rs.activity.lge.allinone
%adb% shell pm %frozen% com.google.android.syncadapters.calendar
%adb% shell pm %frozen% com.android.vending
%adb% shell pm %frozen% com.google.android.gsf
%adb% shell pm %frozen% com.google.android.gms
%adb% shell pm %frozen% com.google.android.feedback
%adb% shell pm %frozen% com.google.android.backuptransport
:adb-navbar
if %mode%==stock ( title 懒人工具盒 - 一键式优化官方系统 - 隐藏导航栏 ) else ( title 懒人工具盒 - 隐藏导航栏)
echo 隐藏导航栏
echo -------------------------------------------------------------------------------
echo.
echo.
echo 	C:沉浸模式，类似于“全屏”的效果。
echo.
echo	X:将导航栏设置到显示区域之外，适用于流体手势之类的需要隐藏导航栏的手势应用。
echo.
if %mode%==stock ( 
echo 	K:取消沉浸		N:跳过 
) else (
echo 	K:取消沉浸
)
echo.
echo.
echo -------------------------------------------------------------------------------
if %mode%==stock ( choice  /c cxknmsl /m "后面那几个选不了" ) else ( choice /c cxk )
if %errorlevel%==1 %adb% shell settings put global policy_control immersive.navigation=*
if %errorlevel%==2 %adb% shell settings put global policy_control null
if %errorlevel%==3 goto adb-overscan
goto adb-reboot
:adb-overscan
if %mode%==stock ( title 懒人工具盒 - 一键式优化官方系统 - 手势型导航栏设置 ) else ( title 懒人工具盒 - 手势型导航栏设置 )
echo 手势型导航栏设置
echo -------------------------------------------------------------------------------
echo 不同的分辨率对应着不同的数值
echo -------------------------------------------------------------------------------
echo.
echo.
echo 	1. 1080p	2. 1440p^(2k^)	3. 自行输入下沉数值 	4.恢复
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "请选择" /c 1234 
if %errorlevel%==1 %adb% shell wm overscan 0,0,0,-143
if %errorlevel%==2 %adb% shell wm overscan 0,0,0,-191
if %errorlevel%==3 goto adb-overscan-loop
if %errorlevel%==4 %adb% shell wm overscan reset
:adb-overscan-loop
if %loop%==off (
echo 数值不满意？再设置一次？
echo -------------------------------------------------------------------------------
choice /c NY /m "	我满意了/再来一次"
echo -------------------------------------------------------------------------------
if %errorlevel%==2 goto adb-overscan-unloop
)
echo 输入下沉数值  
echo -------------------------------------------------------------------------------
set /p overscan=
%adb% shell wm overscan 0,0,0,-%overscan%
set loop=off
goto adb-overscan-loop
:adb-overscan-unloop
if %mode%==stock ( goto adb-reboot ) else ( goto end )


:adb-reboot
if %mode%==stock ( title 懒人工具盒 - 一键式优化官方系统 - 重启 ) else ( title 懒人工具盒 - 高级重启 )
if %mode%==stock ( echo 重启 ) else ( echo 高级重启 )
echo -------------------------------------------------------------------------------
echo 不同的分辨率对应着不同的数值
echo -------------------------------------------------------------------------------
echo.
echo.
echo 	1. 1080p	2. 1440p^(2k^)	3. 自行输入下沉数值 	4.恢复
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "请选择" /c 1234 
if %errorlevel%==1 %adb% shell wm overscan 0,0,0,-143
if %errorlevel%==2 %adb% shell wm overscan 0,0,0,-191
if %errorlevel%==3 goto adb-overscan-loop
if %errorlevel%==4 %adb% shell wm overscan reset

goto end
goto end-wrong

:end-wrong
set /p poweredbyheizi=你掉进了世界!给黑字提交这个bug吧！
goto home
:end
set /p poweredbyheizi=执行完成,按任意键返回主页。
goto home