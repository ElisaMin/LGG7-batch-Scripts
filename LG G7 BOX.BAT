@echo off
set rf=%~dp0
::我在写这个东西的时候有点困还有点便秘，所以这个脚本可能又无聊又屎。
cls 
goto af

:home
echo ======================================
echo =            LG-G7-工具包            =
echo =------------------------------------=
echo = 由“LG G7 ThinQ 垃圾佬快活群”出品 =
echo =      作者:黑字 ^| 群号:620421749    =
echo ======================================
echo = LGUP有一键开启PARTITION DL、互动混 =
echo = 刷等。                             =
echo =------------------------------------=
echo = ADB/Fastboot有很多基于ADB/Fastboot =
echo = 指令制作的选项，例如一键删除laf_a  =
echo = 、无脑刷GSI之类的。                =
echo ======================================
echo ！注意:如果选择LGUP请以管理员打开脚本！
echo ======================================
echo =               请选择               =
echo =------------------------------------=
echo = A.  LGUP       ^| B.  ADB/Fastboot  =
echo ======================================
set /p goto=(A/B)
if %goto%=="a" goto lgup
if %goto%=="b" goto af

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
echo （本脚本修改自https://forum.xda-developers.com/android/general/tecknights-aristo-2-tutorials-t3805141/page3）
echo.
echo ======================================
echo =             LGUP工具包             =
echo =------------------------------------=
echo = 由“LG G7 ThinQ 垃圾佬快活群”出品 =
echo =      作者:黑字 ^| 群号:620421749    =
echo ======================================
echo ++++++++++++++++++++++++++++++++++++++
echo ======================================
echo =               请选择               =
echo =------------------------------------=
echo = 1. 互动式刷固件 ^| 2. 破解LGUP      =
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
  echo  ^|       ADB指令-无需ROOT/TWRP区      ^|   ^+----------------------------------^+
  echo  ^+---------------^+--------------------^+   ^|            Fastboot指令区        ^|
 echo  ^| A1. 时间同步  ^| A2. 隐藏导航栏     ^|   ^+---------------^+------------------^+
  echo  ^+---------------^+-----^+--------------^+   ^| F1. 刷boot    ^| F2. 切换AB分区   ^|
 echo  ^| A3. 一键禁用系统软件^| A4. ADB重启  ^|   ^+---------------^+-^+----------------^+
  echo  ^+------------------------------------^+   ^| F3. 完全刷入GSI ^| F.4只刷System  ^|
  echo  ^| 保留                               ^|   ^+-----------------^+----------------^+
  echo  ^+------------------------------------^+   ^| 保留                             ^|
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
%fastboot%  --disable-verity --disable-verification flash vendor_a %vendorfile%
  echo  执行完毕
  echo  ^+------------------------------------^+
  echo  ^| 请把要刷System.img的拖入窗口       ^|
  echo  ^+------------------------------------^+
set /p systemfile=
%fastboot%  --disable-verity --disable-verification flash system_a %systemfile%
  echo  执行完毕  
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