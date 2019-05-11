@echo off
set rf=%~dp0
cls ::我在写这个东西的时候有点困还有点便秘，所以这个脚本可能又无聊又屎。
if not exist %rf%file\recheche.txt (  
echo 本版本未测试
echo 如果出现问题请
echo.
pause
echo.
echo 截图后！！！
echo.
pause
echo.
echo 私聊群主！！！！
echo.
echo 如果没有截图请详细描述你执行了什么操作
pause
echo "1">file\recheche.txt
)
cls 
goto HOME




:home
cls
 echo ======================================  ^|      本脚本编写环境是1080p Windows10
 echo =            LG-G7-工具包            =  ^|  可能运行在Windows7上格式会崩掉 不过看得懂就好
 echo =------------------------------------=
   echo = 由“LG G7 ThinQ 垃圾佬快活群”出品 =  ^|      出现任何闪退请“私聊”群主并详细说
echo =      作者:黑字 ^| 群号:620421749    =  ^|  名在哪步出现问题，如果出现错误请截图
 echo ======================================
 echo.
 echo -------------------------------------------------------
 echo.
 echo ======================================  ^|      A.LGUP （没啥用 括号删掉） 有替换破解版的lgup和
 echo =            请选择模式              =  ^|  备份当前LG UP之类的 使用本模式请以管理员模式打开。
 echo =------------------------------------=
echo = A.  LGUP       ^| B.  ADB/Fastboot  =  ^|      B.A^/F的工具比较多,例如快速刷GSI、切换AB分区，一键
 echo ======================================  ^|  删除Laf_a啥的。
set /p goto=(A/B)
if %goto%==a goto lgup
if %goto%==A goto lgup
if %goto%==b goto af
if %goto%==B goto af

goto home

:lgup
cls
:lgupchack
echo 检查安装地址中……
if exist "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe" (echo 成功) else (
echo 错误：未检测到LGUP！
echo 请检查安装地址是否存在或手动复制。
goto :end)

echo 检查备份LGUP是否存在中……
if exist "%rf%file\lgup\LGUPR.exe" (
echo 存在 跳过备份
goto uhome ) 
echo 不存在
goto ubackup

:ubackup
echo LG UP.exe备份中
copy "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"  %rf%file\lgup\LGUPR.exe
if not errorlevel 1 goto uhome
echo.
echo 错误:lG UP.exe复制不成功
echo 请以管理者运行该脚本，如果复制不成功请手动复制。
goto :uend

:uhome
cls
echo 一个声明
echo 本脚本修改自https://forum.xda-developers.com/android/general/tecknights-aristo-2-tutorials-t3805141/page3
echo.
choice /m "一秒钟后就会跳转"  /c tecknighs /t 1 /d t
cls
echo.
echo ======================================
echo =             LGUP工具包             =
echo =------------------------------------=
echo = 由“LG G7 ThinQ 垃圾佬快活群”出品 =
echo =      作者:黑字 ^| 群号:620421749    =
echo ======================================
echo.
echo ======================================
echo =               请选择               =
echo =------------------------------------=
echo = 1. 咕咕咕咕咕咕 ^| 2. 破解LGUP      =
echo =------------------------------------=
echo = 3. 还原LGUP     ^| 4.^*流产项目^*     =
echo ======================================
set /p lgupmode=^(1-4^)
if %lgupmode%==1 goto unoob
if %lgupmode%==2 goto ubu
if %lgupmode%==3 goto uru
if %lgupmode%==4 goto ucd

:unoob
echo 咕咕咕
goto uend

:ubu 
copy "%rf%file\lgup\LGUPD.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
echo 指令执行完成
if not errorlevel 1 ( 
echo.
echo LGUP.exe复制成功
echo.
goto ubu-d
)
cls
echo.
echo 错误:lGUP.exe复制不成功
echo 请以管理者运行该脚本，如果再复制不成功请手动复制。
goto :uend

:ubu-d
if not exist "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\" md "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
if not errorlevel 1 ( 
copy "%rf%file\lgup\LGUP_CommonD.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
echo 指令执行完成
echo.
echo dll复制成功
echo.
goto uend
)
echo.
echo 错误:dll复制不成功
echo 请以管理者运行该脚本，如果再复制不成功请手动复制。
goto :uend

:uru
copy "%rf%file\lgup\LGUPR.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
echo 指令执行完成
if not errorlevel 1 ( 
echo.
echo LGUP.exe复制成功
echo.
goto ucu-d
)
cls
echo.
echo 错误:lGUP.exe复制不成功
echo 请以管理者运行该脚本，如果再复制不成功请手动复制。
goto :uend

:ucu-d
del "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
rd "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
echo 指令执行完成
if not errorlevel 1 ( 
echo.
echo dll删除成功
echo.
goto uend
)
cls
echo.
echo 错误:dll删除失败
echo 请以管理者运行该脚本，如果再复制不成功请手动复制。
goto :uend

:ucd
echo 如果你是bat高手请帮我修改一下脚本
goto uend
::这是一个复制文件的
echo 输入Y使用通用dll或 将要刷的dll拖进本窗口内。
set /p ucd=
if "%ucd%"=="y" ( 
copy "%rf%file\lgup\LGUP_CommonD.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
echo 指令执行完成
if not errorlevel 1 ( 
echo.
echo dll复制成功
echo.
goto uend
)
cls
echo.
echo 错误:lG UP.exe复制不成功
echo 请以管理者运行该脚本，如果复制不成功请手动复制。
goto :uend
） else ( 
copy %ucd% "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
echo 指令执行完成
if not errorlevel 1 ( 
echo.
echo dll复制成功
echo.
goto uend
)

:uend
echo ..................
echo H.回到主页
echo L.回到LG UP工具包
echo A.ADB工具包
echo X.关闭
echo ..................
set /p end=^(H/L/A/X^)
if "%end%"=="h" goto home
if "%end%"=="l" goto lgup
if "%end%"=="a" goto af

:echoshit
goto end-this-shit

:af
if not exist "%rf%\file\adb\adb.exe" (
echo.
echo 错误:
echo 未找到adb.exe，请下载完整包。
) else (
echo 成功找到adb.exe
set adb="%rf%\file\adb\adb.exe")
if not exist "%rf%file\adb\fastboot.exe" (
echo.
echo 错误:
echo 未找到fastboot.exe，请下载完整包。
goto aname
) else (
echo 成功找到fastboot.exe
set fastboot="%rf%file\adb\fastboot.exe"
goto ahome)

:aname
echo ==================================================
echo 如果你有adb工具包请输入Y，没有则关闭本窗口。
set /p check=
if %check%=="y" ( goto reseta ) else ( goto reseta)

:reseta
echo ==================================================
echo 请将adb.exe拖入本窗口内
set /p adb=

:resetf
echo ==================================================
echo 请将fastboot.exe拖入本窗口内
set /p fastboot= 



:ahome
cls

%adb% kill-server
cls
 echo  ======================================   ^+----------------------------------^+   
 echo  =          ADB/Fastboot工具包        =   ^| 使用adb指令请到设置中开启USB调试 ^|   我知道这很乱
 echo  =------------------------------------=   ^| 并将USB用于仅充电。              ^|   凑合着看吧
   echo  = 由“LG G7 ThinQ 垃圾佬快活群”出品 =   ^+----------------------------------^+   (十分钟后)
echo  =      作者:黑字 ^| 群号:620421749    =   ^| 使用Fastboot指令请将手机重启至   ^|   我不想做了
 echo  ======================================   ^| Fastboot模式。                   ^|   糊弄一下你们算了
 echo                                           ^+----------------------------------^+   （哭）
  echo  ^+------------------------------------^+  
  echo  ^|       ADB指令-无需ROOT/TWRP区      ^|   ^+----------------------------------^+  提示：
  echo  ^+---------------^+--------------------^+   ^|            Fastboot指令区        ^|  进入Fastboot的方法
 echo  ^| A1. 时间同步  ^| A2. 隐藏导航栏     ^|   ^+---------------^+------------------^+  1.关机 2.按住音量下
  echo  ^+---------------^+-----^+--------------^+   ^| F1. 刷boot    ^| F2. 切换AB分区   ^|  3.插入连接电脑的数据线
 echo  ^| A3. 一键禁用系统软件^| A4. ADB重启  ^|   ^+---------------^+-^+----------------^+
  echo  ^+------------------------------------^+   ^| F3. 完全刷入GSI ^| F.4只刷System  ^|
  echo  ^| 保留                               ^|   ^+-----------------^+----------------^+  ！
  echo  ^+------------------------------------^+   ^| 保留                             ^|    使用该模式请不要以管理员模式打开
  echo  ^| 保留                               ^|   ^|----------------------------------^+
  echo  ^+------------------------------------^+   ^| 保留                             ^|
   echo                                           ^+----------------------------------^+
  echo  ^+-------------------------------------^+----------------^+--------------------^+
  echo  ^|       ADB指令-ROOT/TWRP区           ^| R1. laf_a杀手  ^| R2. 无限重启进TWRP ^|
  echo  ^+-------------------------------------^+----------------^+--------------------^+
  echo  ^| R3. TWRP线刷Zip刷机包                                                     ^|
  echo  ^+---------------------------------------------------------------------------^+
  echo  ^| 保留                                                                      ^|
  echo  ^+---------------------------------------------------------------------------^+
  echo. 
  echo 请选择……
set /p mode=^(F1-4/A1-4/R1-3^)
if %mode%==f1 goto flash-boot
if %mode%==f2 goto ActiveSLOT
if %mode%==f3 goto flash-gsi
if %mode%==f4 goto flash-system

if %mode%==F1 goto flash-boot
if %mode%==F2 goto ActiveSLOT
if %mode%==F3 goto flash-gsi
if %mode%==F4 goto flash-system

if %mode%==a1 goto ntpsetting
if %mode%==a2 goto navbarhider
if %mode%==a3 goto fuckthelgsoftweare
if %mode%==a4 goto noobreboot

if %mode%==A1 goto ntpsetting
if %mode%==A2 goto navbarhider
if %mode%==A3 goto fuckthelgsoftweare
if %mode%==A4 goto noobreboot

if %mode%==r1 goto lafakiller
if %mode%==r2 goto shitloop
if %mode%==r3 goto sideload

if %mode%==R1 goto lafakiller
if %mode%==R2 goto shitloop
if %mode%==R3 goto sideload

:chucefial
echo 走错路了兄嘚
goto end

:adb 模板
cls
  echo  ^+------------------------------------^+  ！请确认你已经
  echo  ^| 时间同步                           ^|    开启USB调试
  echo  ^+------------------------------------^+
  
  echo  出啥问题截图再问
  echo  执行完毕
goto end

:twrp 模板
cls
  echo  ^+------------------------------------^+  ！请确认你已经
  echo  ^| 时间同步                           ^|    进入TWRP并连接上电脑
  echo  ^+------------------------------------^+
  
  echo  出啥问题截图再问
  echo  执行完毕
goto end


:ntpsetting
cls
  echo  ^+------------------------------------^+  ！请确认你已经
  echo  ^| 时间同步                           ^|    开启USB调试
  echo  ^+------------------------------------^+
%adb% shell settings put global ntp_server ntp1.aliyun.com
  echo  出啥问题截图再问
  echo  执行完毕
goto end

:navbarhider
if %recheche%==3  (
cls
echo 输入下沉数值 如需退出 请关闭。
set /p overscan=
%adb% shell wm overscan 0,0,0,-%overscan%
goto navbarhider
)
set recheche=1
cls
  echo  ^+------------------------------------^+  ！请确认你已经
  echo  ^| 隐藏导航栏                         ^|    开启USB调试
  echo  ^+------------------------------------^+
  echo  C:沉浸模式，类似于“全屏”的效果。Q:取消沉浸
  echo  X:将导航栏设置到显示区域之外，适用于手势。
  choice /c cqx
if %errorlevel%==1 %adb% shell settings put global policy_control immersive.navigation=*
if %errorlevel%==2 %adb% shell settings put global policy_control null
if %errorlevel%==3 (
     echo.
     echo  不同的分辨率有不同的效果
     echo  1.1080p 2.2k 3.自行输入参数 4.恢复
     choice /c 1234
     if %errorlevel%==1 %adb% shell wm overscan 0,0,0,-143
     if %errorlevel%==2 %adb% shell wm overscan 0,0,0,-191
     if %errorlevel%==3 (
	     cls
         echo 输入下沉数值
         set /p overscan=
          %adb% shell wm overscan 0,0,0,-%overscan%
     )
     if %errorlevel%==4 %adb% shell wm overscan reset
)
  echo  出啥问题截图再问
  echo  执行完毕
set recheche=3
goto navbarhider

:fuckthelgsoftweare
cls
  echo  ^+------------------------------------^+  ！请确认你已经
  echo  ^| 禁用应用                           ^|    开启USB调试
  echo  ^+------------------------------------^+
  choice /c dj /m "D冻结 J解冻"
  if %errorlevel%==1 set frozen=disable-user
  if %errorlevel%==2 set frozen=enable
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
  echo  出啥问题截图再问
  echo  执行完毕
goto end

:noobreboot
cls
  echo  ^+------------------------------------^+  ！请确认你已经
  echo  ^| ADB重启                            ^|    开启USB调试
  echo  ^+------------------------------------^+
  echo  E. 普通重启  R. Recovery模式  
  echo  B. 可能会重启进Fastboot
  choice /c erb
  if %errorlevel%==1 %adb% reboot
  if %errorlevel%==2 %adb% reboot recovery
  if %errorlevel%==3 %adb% reboot bootloader
  echo  出啥问题截图再问
  echo  执行完毕
goto end

:lafakiller
cls
  echo  ^+------------------------------------^+  ！请确认你已经
  echo  ^| laf_a杀手                          ^|    开启USB调试或
  echo  ^+------------------------------------^+    进入TWRP并连接上电脑
  echo  三键之内杀了你 
  echo.
  echo  请留意Root权限申请
  pause
  %adb% shell "su -c 'dd if=/dev/zero of=/dev/block/platform/soc/1d84000.ufshc/by-name/laf_a'"
  echo  出啥问题截图再问
  echo  执行完毕
goto end

:shitloop
cls
  echo  ^+------------------------------------^+  ！请确认你已经
  echo  ^| 无限重启进TWRP                     ^|    进入TWRP并连接上电脑
  echo  ^+------------------------------------^+
  pause
  %adb% shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/misc bs=256 count=1 conv=notrunc
  echo  出啥问题截图再问
  echo  执行完毕
goto end

:sideload
if recheche=
cls
  echo  ^+------------------------------------^+  ！请确认你已经
  echo  ^| TWRP线刷Zip刷机包                  ^|    进入TWRP并连接上电脑
  echo  ^+------------------------------------^+
  echo  请进入TWRP后点击“高级/Advanced”选择“
  echo  ADB Sideload”后滑动下方的按钮
  pause
  echo  请把要刷的刷机包拖入本窗口
  set /p sideload=
  %adb% sideload %sideload%
  set recheche=2
  echo  出啥问题截图再问
  echo  执行完毕
  echo  如需退出请关闭窗口
  echo  请把要刷的刷机包拖入本窗口
  set /p sideload=
  %adb% sideload %sideload%
goto sideload

:flash-boot
cls
  echo  ^+------------------------------------^+
  echo  ^| 请把要刷的Boot.img拖入窗口         ^|
  echo  ^+------------------------------------^+
set /p bootfile=
%fastboot% flash boot_a %bootfile%
%fastboot% flash boot_b %bootfile%
  echo  执行完毕
  echo  出啥问题截图再问
goto end


:ActiveSLOT
cls
  echo  ^+------------------------------------^+
  echo  ^| 切换AB分区模式                     ^|
  echo  ^+------------------------------------^+
  echo  你要激活哪个分区？
choice /c ab
if %errorlevel%==1 %fastboot% --set-active=a
if %errorlevel%==2 %fastboot% --set-active=b
echo 执行完毕
echo 是否重启手机？
choice /c yn
if %errorlevel%==1 %fastboot% reboot
if %errorlevel%==2 goto end
goto end

:flash-gsi
cls
  echo  ^+------------------------------------^+
  echo  ^| 请把要刷vbmeta.img的拖入窗口       ^|
  echo  ^+------------------------------------^+
set /p vbmetafile=
%fastboot%  --disable-verity --disable-verification flash vbmeta_a %vbmetafile%
  echo  执行完毕
  echo  ^+------------------------------------^+
  echo  ^| 请把要刷boot.img的拖入窗口         ^|
  echo  ^+------------------------------------^+
set /p bootfile=
%fastboot%  --set-active=a flash boot_a %bootfile%
  echo  执行完毕
  echo  ^+------------------------------------^+
  echo  ^| 请把要刷vendor.img的拖入窗口       ^|
  echo  ^+------------------------------------^+
set /p vendorfile=
%fastboot%  flash vendor_a %vendorfile%
  echo  执行完毕
  echo  ^+------------------------------------^+
  echo  ^| 请把要刷System.img的拖入窗口       ^|
  echo  ^+------------------------------------^+
set /p systemfile=
%fastboot% flash system_a %systemfile%
  echo  执行完毕  
  %fastboot% -w reboot
  echo  。。。重启中
goto end




:flash-system
cls
  echo  ^+------------------------------------^+
  echo  ^| 请把要刷的System.img拖入窗口       ^|
  echo  ^+------------------------------------^+
set /p systemfile=
%fastboot%  --disable-verity --disable-verification flash system_a %systemfile%
  echo  执行完毕
  echo  出啥问题截图再问
goto end

:end
:end-this-shit
set /p end=
call "LG G7 BOX.BAT"