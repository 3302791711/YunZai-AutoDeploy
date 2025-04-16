@echo off
chcp 65001

%定义默认路径%
set NAPCAT_PATH=%CD%\NapCat\                                                                              %NapCat路径（路径内包含exe和kill）%
set KOISHI_PATH=%CD%\Koishi\                                                                                   %Koishi路径（路径内包含Koi.exe）%
set REDIS_PATH=%CD%\Redis-7.4.2-Windows-x64-cygwin-with-Service\               %Redis路径（路径内包含redis-server.exe）%
set YUNZAI_PATH=%CD%\Yunzai\                                                                                 %YunZai路径（路径内包含app.js）%

%定义WebUI端口%
set port1=3101                                                                      %NapCat的开放端口%
set port2=8765                                                                      %GuoBa的开放端口%
set port3=5141                                                                      %Koishi的开放端口%
set port4=23306                                                                    %开发面板的开放端口%
::set port5=<端口>                                                                %备用的开放端口，删掉::即可启用%
rem ———————————————————————————————————————————————

echo ———————————————————————
tasklist | find /i "qq.exe" >nul
if %errorlevel% equ 0 (
    echo 检测到QQ正在运行，是否退出QQ并重启？（True：1；False：0）
    goto :vars
) else (
    goto :Reboot
)

:vars
set /p var=请输入1或0：
if not "%var%"=="1" if not "%var%"=="0" (
    echo 输入无效，不是有效范围的数字
    echo 按任意键退出......
    set /p Enter=
    exit
) else if "%var%"=="1" (
    goto :Reboot
) else (
    goto :skipqq
)

%子过程%
:Reboot
    start cmd /c "cd /d %NAPCAT_PATH% && killQQ.bat"
    ping 127.0.0.1 -n 2 >nul
    start cmd /c "cd /d %NAPCAT_PATH% && NapCatWinBootMain.exe"
    echo 正在打开NapCat协议框架
    ping 127.0.0.1 -n 6 >nul


rem ———————————————————————————————————————————————

%Koishi过渡过程%
:skipqq
REM 打开Koishi框架
tasklist | find /i "koi.exe" >nul
if %errorlevel% equ 0 ( 
    echo 检测到Koishi框架正在运行
) else (
    echo on
    start cmd /k "cd /d %KOISHI_PATH% && koi.exe"
    echo off
    echo 正在打开Koishi机器人框架
    ping 127.0.0.1 -n 6 >nul
)

rem ———————————————————————————————————————————————

%YunZai框架%
goto :Redis
goto :YunZai
goto :end
%子过程%
:Redis
tasklist | find /i "redis-server.exe" >nul
if %errorlevel% equ 0 (  
    echo 检测到Redis正在运行
) else (
    start cmd /k "cd /d %REDIS_PATH% && redis-server.exe"
    ping 127.0.0.1 -n 3 >nul
    echo 正在打开Redis数据库服务
    ping 127.0.0.1 -n 6 >nul
)

:YunZai
start cmd /k "cd /d %YUNZAI_PATH% && node app.js" 
echo 正在打开YunZai机器人框架
ping 127.0.0.1 -n 6 >nul

%结束过程%
:end
echo ———————————————————————

rem ———————————————————————————————————————————————

exit