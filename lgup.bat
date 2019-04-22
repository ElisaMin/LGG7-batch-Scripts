@echo off
SET RUNPATH=%~dp0

echo 检查安装地址中……
if exist "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe" (echo 成功) else (
echo 错误：未检测到LGUP！
echo 请检查安装地址是否存在或手动复制。
goto :end)

echo 检查备份LGUP是否存在中……
if exist "%RUNPATH%\R\LGUP.exe" (
echo 存在 跳过备份
goto star ) 
echo 不存在
goto backuping

:backuping
echo LG UP.exe备份中
copy "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"  "%RUNPATH%\R\LGUP.exe"
if not errorlevel 1 goto star
cls
echo.
echo 错误:lG UP.exe复制不成功
echo 请以管理者运行该脚本，如果复制不成功请手动复制。
goto :end

:backup
echo dll 备份中
copy "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll" "%RUNPATH%\R\LGUP_Common.dll" 
goto star

:star
cls 
echo LG G7 ThinQ 垃圾佬快活群专版
echo.
echo     LG UP修改器 (G7)
echo     ================
echo     -  刷机有风险  -
echo     -  刷机需谨慎  -
echo     ================
echo     -1.开发者模式  -
echo      - -混刷选我-  -
echo     ----------------
echo     - 2. 普通模式  -
echo     -  -原味LGUP-  -
echo     ----------------
echo     -  3.恢复模式  -
echo     - 恢复LGUP备份 -
echo     ----------------
echo     -  4.一键改dll -
echo     - 我懒得复制啊 -
echo     ================ 
echo.
echo 来选一个吧，小老弟。
set /p command=^(1-4^) %=%
if "%command%"=="1" goto developer
if "%command%"=="2" goto usermode
if "%command%"=="3" goto recover
if "%command%"=="4" goto justdll

:developer
cls
mkdir "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common"
echo.
echo 创建common文件夹成功
echo.
copy "%RUNPATH%\D\LGUP_CommonD.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
if not errorlevel 1 ( 
echo.
echo dll复制成功
echo.
goto developers
)
echo 错误：dll不成功
echo 请以管理者运行该脚本，如果复制不成功请手动复制。
goto developers

:developers
copy "%RUNPATH%\D\LGUPD.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if not errorlevel 1 ( 
echo.
echo LGUP.exe复制成功
echo.
goto done
)
cls
echo.
echo 错误:lG UP.exe复制不成功
echo 请以管理者运行该脚本，如果复制不成功请手动复制。
goto :end



:usermode
cls
mkdir "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common"
echo.
echo 创建common文件夹成功
echo.
copy "%RUNPATH%\U\LGUP_CommonU.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
if not errorlevel 1 ( 
echo.
echo dll复制成功
echo.
goto developers
)
echo 错误：dll不成功
echo 请以管理者运行该脚本，如果复制不成功请手动复制。
goto usersmode

:usersmode
copy "%RUNPATH%\U\LGUPU.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if not errorlevel 1 ( 
echo.
echo LGUP.exe复制成功
echo.
goto done
)
cls
echo.
echo 错误:lG UP.exe复制不成功
echo 请以管理者运行该脚本，如果复制不成功请手动复制。
goto :end


:recover
cls
echo.
echo 第一次打开本脚本时脚本会备份一个LGUP.exe
echo 现在正在还原中
goto recovery

:recovery
copy "%RUNPATH%\R\LGUPR.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if not errorlevel 1 ( 
echo.
echo LGUP.exe复制成功
echo.
echo 打开在桌面/开始菜单/其他地方的快捷方式即可（当然你也可以去安装目录里找）
)
cls
echo.
echo 错误:lG UP.exe复制不成功
echo 请以管理者运行该脚本，如果复制不成功请手动复制。
goto :end


:justdll


SET RUNPATH=%~dp0
mkdir "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common"
copy "%RUNPATH%LGUP_CommonU.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
if not errorlevel 1 goto CPYEXE
echo 文件复制不成功，请以管理者运行该脚本，如果复制不成功请手动复制。
choice /T 1 /C ync /CS /D y /n
cls
goto :end

:CPYEXE
copy "%RUNPATH%LGUPU.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if not errorlevel 1 goto :end
echo 文件复制不成功，请以管理者运行该脚本，如果复制不成功请手动复制。
pause

:endd
echo 错误:未能找到LG UP，请检查安装地址或手动复制。
echo 

:done
cls
echo 复制成功
echo 打开在桌面/开始菜单/其他地方的快捷方式即可（当然你也可以去安装目录里找）

:end
echo.
echo 走了老弟，看啥呢？
pause
echo （本脚本修改自https://forum.xda-developers.com/android/general/tecknights-aristo-2-tutorials-t3805141/page3） 
echo 作者：黑字（加群请我吃辣条呗）
pause