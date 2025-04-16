@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

%定义默认路径（可以直接从启动BOT里复制过来的）%
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

:menu
cls
set help=
echo 可用指令: 
echo 1.【启动】一键启动BOT
echo 2.【帮助】查看BOT后台帮助.
echo 3.【代理】获取免费的公益HTTP代理.
echo 4.【WebUI】打开所有WebUI控制台.
echo 5.【安装插件】用npm给koishi安装.
echo 6.【安装插件】用git克隆给yunzai安装插件.
echo 7.【WS服务器】修改ws服务器/ws客户端.
::echo 4.【安装插件】利用npm给koishi安装插件.

set /p help=请写入可用的指令: 
if /i "%help%"=="1"  goto :case1
if /i "%help%"=="2"  goto :case2
if /i "%help%"=="3"  goto :case3
if /i "%help%"=="4"  goto :case4
if /i "%help%"=="5"  goto :case5
if /i "%help%"=="6"  goto :case6
if /i "%help%"=="7"  goto :case7
goto :error

:error
    echo 指令无效或不存在
    set /p esc=
    goto :menu

rem ———————————————————————————————————————————————

:case1
echo 正在打开BOT启动脚本......
ping 127.0.0.1 -n 6 >nul
start "" "一键启动BOT.bat"
exit

:case2
cls
set help=
echo  欢迎使用【TRSS-Yunzai BOT】 
echo 【#帮助】查看指令说明.
echo 【#状态】查看运行状态.
echo 【#日志】查看运行日志.
echo 【#重启】重新启动.
echo 【#更新】拉取 Git 更新.
echo 【#全部更新】更新全部插件.
echo 【#更新日志】查看更新日志.
echo 【#设置主人】设置主人账号.
echo 【#安装插件】查看可安装插件.
echo  按回车返回...... 
set /p esc=
goto :menu

:case3
cls
set help=
echo 公益代理请添加QQ：965629725
echo 按回车返回...... 
set /p esc=
goto :menu

:case4
start http://127.0.0.1:%port1%
start http://127.0.0.1:%port2%/guoba
start http://127.0.0.1:%port3%
start http://127.0.0.1:%port4%
::start http://127.0.0.1:%port5%                                               %备用的WebUI打开指令，删掉::即可启用%
goto :menu

:case5
cls
set help=
echo Koishi主路径为: %KOISHI_PATH%
echo.
echo ————————————————————————————————

echo 名字可以从Github中复制

echo 例如：koishi-plugin-puppeteer

echo ————————————————————————————————

echo 插件下载地址：https://koishi.chat/zh-CN/market/
set /p npm=请输入Koishi插件名（后面可加上版本@0.1.1) :
start cmd /wait "" /c "cd /d %KOISHI_PATH% && npm i %npm% && echo 按回车返回...... && set /p esc="
echo 按回车返回......
set npm=
set /p esc=
goto :menu

:case6
cls
set help=
echo 当前YunZai主路径为: %YUNZAI_PATH%
echo ————————————————————————————————————————————————————————————

echo 名称是插件目录下文件夹的名字，可以随意起
echo 插件地址是插件的git/gitee地址，也可以使用镜像源地址
echo 例如：https://gitee.com/yhArcadia/Yunzai-Bot-plugins-index
echo ————————————————————————————————————————————————————————————

echo 插件下载地址：https://gitee.com/yhArcadia/Yunzai-Bot-plugins-index
set /p name=请输入GitHub插件名称:
set /p git=请输入GitHub插件地址:
start cmd /wait "" /c "cd /d %YUNZAI_PATH% && git clone %git% ./plugins/%name% && echo 按回车返回...... && set /p esc="
echo 按回车返回......
set name=
set git=
set /p esc=
goto :menu

:case7
cls
set "file_path=%CD%\Yunzai\config\config\server.yaml"
powershell -NoProfile -ExecutionPolicy Bypass -Command "& { notepad.exe '%file_path%' }"

echo 已打开YunZai的ws端口设置文件，请在第一处port中修改端口

echo 修改完成后保存并关闭，再输入回车......

pause >nul
cls
echo Koishi默认端口为5140

echo 已打开NapCat的ws设置页面：

echo 在网络配置中，新建两个WebSocket客户端

echo ——————————————————————————————————————————

echo 第一个客户端的参数为：

echo 名称：YunZai
echo 地址URL：ws://localhost:端口/onebot
echo 端口为刚才打开文件夹修改的port

echo ——————————————————————————————————————————

echo 第二个客户端的参数为：

echo 名称：Koishi
echo 地址URL：ws://localhost:5140/onebot
echo 端口是Koishi的默认端口，可以在控制台修改
echo ——————————————————————————————————————————

echo 设置前请确保Koishi、YunZai正常运行
echo 以上内容修改完成后，回车即可返回......
set url="http://127.0.0.1:%port1%/webui/network"
start "NapCat" "%url%"

pause >nul
goto :menu
