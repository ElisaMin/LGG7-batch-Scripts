@echo off
解锁bl工具
color 3e
mode con cols=90 lines=40
cd %cd%
:STARTS
CLS
ECHO.来自G7群矢陨（借鉴LINEAGEOS 0729刷写工具）
ECHO.解锁bl工具(仅部分版本可使用)
ECHO.
ECHO.测试版本有问题联系群管理矢陨
ECHO.测试版本有问题联系群管理矢陨
ECHO.测试版本有问题联系群管理矢陨
ECHO.======================================================================================
ECHO. 注意：
ECHO.      1.请确定当前手机版本为ulm11g版本,且打开了usb调试以及OEM
ECHO.      2.手机数据线连接电脑 
ECHO.      3.电脑已经安装了LG的驱动

ECHO.==========================制作: LG G7 ThinQ群:275250706====================
ECHO.
ECHO.       请选择你的操作?
ECHO.
ECHO.                    确定已经为ulm11g
ECHO.
ECHO.                    1.从0开始解锁bl锁
ECHO.   
ECHO.                    2.在系统想要进fastboot
ECHO.
ECHO.                    3.卸载magisk并安装新版本面具
ECHO.
ECHO.                    4.刷入ulm11g的rootedboot(仅解开bl且打开OEM后可以用，配合3效果最佳)
ECHO.    
ECHO.                    5.在系统内恢复abl_a(已打开usb调试以及有root权利)
ECHO.          
ECHO.                    6.如果你在替换abl_a后的时候断开了，请选择这个选项
ECHO.       
ECHO.                    0.退出
ECHO.                          
ECHO.=======================================================================================
:CHO
set choice=
set /p choice= 输入对应数字，然后按回车键:
if /i "%choice%"=="1" goto devices
if /i "%choice%"=="2" goto adbreboot
if /i "%choice%"=="3" goto magisk1
if /i "%choice%"=="4" goto rootedboot1
if /i "%choice%"=="5" goto abl-b
if /i "%choice%"=="6" goto oem
if /i "%choice%"=="0" goto SECEDE
echo 选择无效，请重新输入
echo.
GOTO STARTS

:devices
CLS
ECHO ***************************************************************************************
ECHO *                                                                                     *
ECHO *                              正在检测手机是否正常连接,请稍候...                             *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO.
ECHO.检测手机是否正常连接
ECHO.Running
adb  devices
set /p choice= 若显示 LMG710***********      device，输入1并按回车键:
if /i "%choice%"=="1" goto adbreboot
if /i "%choice%"=="0" goto SECEDE
ECHO.OFF

:adbreboot
CLS
ECHO ***************************************************************************************
ECHO *                                                                                     *
ECHO *                            正在重启至fastboot,请稍候...                             *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO.
ECHO.正在重启至fastboot...
ECHO.Running
adb reboot bootloader 
set /p=等待进入bootloader后,按任意键进行下一步
ECHO.OFF
set /p choice= 输入1进行下一步，输入2返回主菜单:
if /i "%choice%"=="1" goto rootedboot
if /i "%choice%"=="2" goto STARTS

:rootedboot
CLS
ECHO ***************************************************************************************
ECHO *                                                                                     *
ECHO *                              正在启动ulm11gRootedboot,请稍候...                             *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO.

ECHO ***************************************************************************************
ECHO *                 正确刷入将显示                                                                    
ECHO *                fastboot devicesDownloading 'boot.img'                  OKAY [  0.506s]
ECHO *                booting                                            OKAY [  0.052s]
ECHO *                Finished. Total time: 0.639s
ECHO *                按道理来说你已经重启了，重启完成多出了个MagiskManager。  
ECHO *                                                                                 
ECHO ***************************************************************************************
ECHO.正在刷入ulm11gRootedboot...
ECHO.Running
fastboot boot rootedboot.img
set /p=等待进入系统后，按任意键进行下一步
ECHO.OFF
goto magisk

:rootedboot1
CLS
ECHO ***************************************************************************************
ECHO *                                                                                     *
ECHO *                              正在刷入ulm11gRootedboot,请稍候...                             *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO.

ECHO.正在刷入ulm11gRootedboot...
ECHO.Running
fastboot flash boot_a rootedboot.img
fastboot flash boot_b rootedboot.img
set /p=等待进入系统后，按任意键进行下一步
ECHO.OFF
goto magisk1

:magisk 
CLS
ECHO
ECHO ***************************************************************************************
ECHO *                                                                                     
ECHO *              正在卸载旧版本magiskmanager并安装7.3.3版本magisk manager           
ECHO *              安装成功将会显示
ECHO *              Sucess
ECHO *              Sucess                                                                  
ECHO ***************************************************************************************
ECHO.

ECHO ***************************************************************************************
ECHO *                 正在导入abl_a以及abl-a到目录下
ECHO *                 正确导入将显示                                                                    
ECHO *                adb push abl_a/abl-a.bin /sdcard/
ECHO *                ****\abl_a  14.6 MB/s (1048576 bytes in 0.068s)
ECHO *                                                                                                 
ECHO ***************************************************************************************
ECHO.Running
adb devices
adb uninstall com.topjohnwu.magisk
adb install MagiskManager-v7.5.1.apk
adb push abl_a /sdcard/
adb push abl-a.bin /sdcard/
set /p=按任意键进行下一步
ECHO.OFF
goto adbshell

:magisk1
CLS
ECHO
ECHO ***************************************************************************************
ECHO *                                                                                     
ECHO *              正在卸载旧版本magiskmanager并安装7.3.3版本magisk manager           
ECHO *              安装成功将会显示
ECHO *              Sucess
ECHO *              Sucess                                                                  
ECHO ***************************************************************************************
ECHO.
ECHO.Running
adb devices
adb uninstall com.topjohnwu.magisk
adb install MagiskManager-v7.5.1.apk
set /p=按任意键进返回主菜单
ECHO.OFF
goto STARTS

:adbshell
CLS
ECHO
ECHO ***************************************************************************************
ECHO * 
ECHO *                          1.打开MagiskManager                                                       
ECHO *                          2.等待授权adb shell权利
ECHO *                          3.如果没有弹窗提示，请手动输入su并点左上角超级用户
ECHO *                          4.授权adb shell的超级用户权利
ECHO *                          5.请确认已授权adb shell 后再进行下一步             
ECHO *                          6.授权完成后可以关闭页面进入第三步了  
ECHO *                          7.输入exit直到进行下一步                                                 
ECHO ***************************************************************************************
ECHO.
ECHO.Running
adb shell " su -c "
set /p=按任意键进行下一步
ECHO.OFF
goto abl

:abl
CLS
ECHO
ECHO ***************************************************************************************
ECHO *
ECHO *                     正在替换系统的abl_a....
ECHO *          
ECHO *        
ECHO *             替换成功后-输入exit直到进行下一步
ECHO ***************************************************************************************
ECHO.

ECHO ***************************************************************************************
ECHO *                          正确替换将显示
ECHO *      adb shell " su -c 'dd if=/sdcard/abl_a of=/dev/block/bootdevice/by-name/abl_a '"
ECHO *      2048+0 records in
ECHO *      2048+0 records out
ECHO *      1048576 bytes transferred in 0.094 secs (11155063 bytes/sec)
ECHO *                                                                                                
ECHO ***************************************************************************************
ECHO.Running
adb shell " su -c 'dd if=/sdcard/abl_a of=/dev/block/bootdevice/by-name/abl_a'"
exit
ECHO.
set /p=按任意键进行下一步
ECHO.OFF
goto oem

:abl-b
CLS
ECHO
ECHO ***************************************************************************************
ECHO *
ECHO *                     正在替换系统的abl_a
ECHO * 
ECHO * 
ECHO ***************************************************************************************
ECHO.

ECHO ***************************************************************************************
ECHO *                          正确替换将显示
ECHO *      adb shell " su -c 'dd if=/dev/block/bootdevice/by-name/abl_b of=/dev/block/bootdevice/by-name/abl_a'"
ECHO *      2048+0 records in
ECHO *      2048+0 records out
ECHO *      1048576 bytes transferred in 0.094 secs (11155063 bytes/sec)
ECHO *                                                                                                
ECHO ***************************************************************************************
ECHO.Running
adb shell " su -c 'dd if=/dev/block/bootdevice/by-name/abl_b of=/dev/block/bootdevice/by-name/abl_a'"
exit
ECHO.
set /p=按任意键进行下一步
ECHO.OFF
goto STARTS

:oem
CLS
ECHO
ECHO ***************************************************************************************
ECHO *                       正在重启至fastboot......
ECHO *                       
ECHO *
ECHO ***************************************************************************************
ECHO.
ECHO.Running
adb reboot bootloader
set /p=进入fastboot后,按任意键进行下一步

ECHO ***************************************************************************************
ECHO *                   正在解锁BL锁.......
ECHO *                   正确解锁后将显示
ECHO *                   fastboot oem unlock
ECHO *                  (bootloader) Erasing userdata and cache
ECHO *                  OKAY [  4.073s]
ECHO *                   Finished. Total time: 4.075s
ECHO ***************************************************************************************
ECHO.Running
fastboot devices
fastboot oem unlock
ECHO.
set /p=按任意键进行下一步
ECHO.Running
fastboot flash boot_a rootedboot.img
fastboot flash boot_b rootedboot.img
fastboot flash frp frp.frp
fastboot flash abl_a abl-a.bin
fastboot reboot
CLS
ECHO ***************************************************************************************
ECHO *                             请注意重启时是否有黄色感叹号
ECHO *
ECHO ***************************************************************************************
set /p=按任意键进行下一步
ECHO.OFF
goto END

:END
CLS
ECHO ***************************************************************************************
ECHO *
ECHO *                    如果一切顺利
ECHO *                   那么你已经解开了bl锁
ECHO *                   
ECHO ***************************************************************************************
ECHO.Running
adb devices
adb uninstall com.topjohnwu.magisk
adb install MagiskManager-v7.5.1.apk
set /p=按任意键进行下一步
ECHO.OFF
goto SECEDE
