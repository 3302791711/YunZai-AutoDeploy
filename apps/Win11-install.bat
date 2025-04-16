@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
set qq=
set rediszip=


:: 安装 Wget
echo 正在检测Wget是否安装......

echo 若是Wget一直在检测，请先查看temp.txt缓存文件中的输出结果

echo 若提示输入（Y/N），则输入Y同意。（实在不行可以重启）
ping 127.0.0.1 -n 4  >nul
if not exist "%CD%\temp" mkdir "%CD%\temp"
winget list --name "Wget" > %CD%\temp\temp.txt
find "Wget" %CD%\temp\temp.txt  > nul

if %errorlevel% == 0 (
    echo 检测到Wget已安装！
) else (
    echo 检测到未安装 Wget

    echo 将开始安装......
    winget install wget
    if %errorlevel% == 0 (
        echo Wget安装成功！
    ) else (
        echo Wget安装出错！请前往 https://www.gnu.org/software/call wget 进行手动安装。
    )
)

::结束 Wget
del %CD%\temp\temp.txt
endlocal
echo 按回车以继续......
set /p Enter=
cls

::设置 Mirror（镜像源）

echo ★ 请选择你的镜像源

echo 镜像源参考：https://fcp7.com/github-mirror-daily-updates.html
set /p Mirror=镜像地址：




:: 安装 NapCat
cls
echo 正在检测 NapcCat 是否安装......
ping 127.0.0.1 -n 5  >nul
if exist NapCat (
    echo 检测到 NapCat 已安装！
    goto skipnapcat
) else (
    echo 检测到未安装 NapCat

    echo 开始下载 NapCat 压缩包......
    call wget -O "NapCat.zip" "%Mirror%/NapNeko/NapCatQQ/releases/download/v4.5.22/NapCat.Framework.Windows.Once.zip" >nul
    if %errorlevel% == 0 (
        cls
        echo NapCat 下载成功！
        goto zip
    ) else (
        cls
        echo NapCat 下载出错！请前往 https://github.com/NapNeko/NapCatQQ 进行手动下载。
        goto skipnapcat
    )
)

:: 解压 NapCat
:zip
echo 正在解压NapCat......
powershell -nologo -noprofile -command "& { try { Add-Type -AssemblyName 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('NapCat.zip', '%CD%\NapCat'); exit 0; } catch { exit 1; } }"
if %errorlevel% neq 0 (
    echo 解压失败！可尝试手动解压该文件。
    goto skipnapcat
) else (
    echo NapCat已成功解压到NapCat文件夹当中
    del NapCat.zip
)

::结束 NapCat
:skipnapcat
echo 按回车以继续......
set /p Enter=
cls




:: 安装 QQ
if exist Tencent_*.exe echo 检测到QQ已下载，可以选择退出！
echo 请选择要安装的QQ版本：
echo 1. QQ9.9.16.29271_x64.exe
echo 2. QQ9.9.16.29271_x86.exe
echo 3. 退出安装

set /p qq=请输入（1-3）：
if %qq%==1 goto qq1
if %qq%==2 goto qq2
if %qq%==3 goto skipqq
echo 指令无效！
pause >nul
exit

:qq1
cls
echo 正在下载 Tencent_x64.exe......
call wget -O "Tencent_x64.exe" "https://dldir1.qq.com/qqfile/qq/QQNT/592d67a6/QQ9.9.16.29271_x64.exe" >nul
if %errorlevel% == 0 (
    cls
    echo QQ下载完成！

    echo QQ下载完成后，建议直接安装到NapCat目录当中。
    set /p Enter=
    goto skipqq
) else (
    cls
    echo QQ下载失败，请前往 https://dldir1.qq.com/qqfile/qq/QQNT/592d67a6/QQ9.9.16.29271_x64.exe 进行手动下载。

    echo QQ下载完成后，请直接手动安装到NapCat目录当中。
    set /p Enter=
    goto skipqq
)

:qq2
cls
echo 正在下载 Tencent_x86.exe......
call wget -O "Tencent_x86.exe" "https://dldir1.qq.com/qqfile/qq/QQNT/874df828/QQ9.9.16.29271_x86.exe" >nul
if %errorlevel% == 0 (
    cls
    echo QQ下载完成！

    echo QQ下载完成后，建议直接安装到NapCat目录当中。
    set /p Enter=
    goto skipqq
) else (
    cls
    echo QQ下载失败，请前往 https://dldir1.qq.com/qqfile/qq/QQNT/874df828/QQ9.9.16.29271_x86.exe 进行手动下载。

    echo QQ手动下载完成后，请直接手动安装到NapCat目录当中。
    set /p Enter=
    goto skipqq
)

:skipqq
cls




:: 安装 Koishi
echo 正在检测 Koishi 是否安装......
ping 127.0.0.1 -n 5  >nul
if exist Koishi (
    echo 检测到 Koishi 已安装！
    goto skipkoishi
) else (
    echo 检测到未安装 Koishi

    echo 开始下载 Koishi 压缩包......
    call wget -O "Koishi.zip" "%Mirror%/koishijs/koishi-desktop/releases/download/v1.1.3/koishi-desktop-win-x64-v1.1.3.zip" >nul
    if %errorlevel% == 0 (
        cls
        echo Koishi 下载成功！
        goto zip1
    ) else (
        cls
        echo Koishi 下载出错！请前往 https://github.com/koishijs/koishi-desktop 进行手动下载。
        goto skipkoishi
    )
)

:: 解压 Koishi
:zip1
echo 正在解压Koishi......
powershell -nologo -noprofile -command "& { try { Add-Type -AssemblyName 'System.IO.Compression.FileSystem'; [System.IO.Compression.ZipFile]::ExtractToDirectory('Koishi.zip', '%CD%/Koishi'); exit 0; } catch { exit 1; } }"
if %errorlevel% neq 0 (
    echo 解压失败！可尝试手动解压该文件。
    goto skipkoishi
) else (
    echo Koishi已成功解压到Koishi文件夹当中
    del Koishi.zip
)

::结束 Koishi
:skipkoishi
echo 按回车以继续......
pause >nul
cls



echo                       注意事项
echo ———————————————————————————————————————————————————————

echo  本脚本将自动为你下载Redis，其余内容可参考下面的链接.
echo  因为Wget下载较为不稳定，所以这几个需要手动下载.
echo  先把Git、Node.js下载完并安装后，再回车进行下一步操作.
echo  因为下一步操作需要用Git指令进行仓库克隆.
echo ———————————————————————————————————————————————————————
echo.
echo 云崽BOT需要用到以下内容：
echo 1. Redis：云崽的数据库服务器
echo 2. Git：实现Git下载以及克隆
echo 3. Node.js (v21以上) ：实现云崽程序的运行
echo 4. Chrome (可选) ：可用浏览器服务进行图片生成
echo.
echo 参考链接：
echo Git：https://git-scm.com/      Node.js：https://nodejs.org/zh-cn
echo Chrome：https://google-chrom.cn/      Redis：https://redis.io/
echo.
echo 若有问题，可以反馈QQ：965629725
echo 按回车以继续......


set /p Enter=
cls


:: 安装 YunZai
echo 正在检测YunZai是否安装......
ping 127.0.0.1 -n 5 >nul
if exist YunZai (
    echo 检测到YunZai已安装！

    echo 按回车以继续...... 
    set /p Enter=
    goto skipyunzai
) else (
    echo 检测到未安装 YunZai

    echo 正在从Gitee克隆YunZai仓库

    git clone --depth 1 https://gitee.com/TimeRainStarSky/Yunzai
    if %errorlevel% == 0 (
        echo YunZai下载完成！
	set /p Enter=
        goto skipyunzai
    ) else (
        echo YunZai下载失败
        echo 请前往 https://github.com/TimeRainStarSky/Yunzai 进行手动安装
	set /p Enter=
        goto skipyunzai
    )
)

:skipyunzai
cls

:: 安装 Redis
if exist Redis-7.4.2-Windows-x64-*-with-Service (
    echo 检测到Redis已安装！
    goto skipredis
) else (
    echo 检测到未安装 Redis
    goto redis
    goto redisjy
)

:redis
echo 请选择你需要的Redis版本：
echo 1.Redis-7.4.2-Windows-x64-cygwin-with-Service.zip
echo 2.Redis-7.4.2-Windows-x64-msys2-with-Service.zip
echo 3.退出安装

echo 版本之间大同小异，可随意选择。

set /p server=请输入（1-3）：
if %server% == 1 goto redis1
if %server% == 2 goto redis2
if %server% == 3 goto skipredis
echo 指令无效！
pause >nul
exit

:redis1
cls
echo 正在下载 Redis-7.4.2-Windows-x64-cygwin-with-Service.zip......
call wget -O "Redis_cygwin.zip" "%Mirror%/redis-windows/redis-windows/releases/download/7.4.2/Redis-7.4.2-Windows-x64-cygwin-with-Service.zip" >nul
if %errorlevel% == 0 (
    cls
    echo Redis下载完成！
    set rediszip=Redis_cygwin.zip
    goto redisjy
) else (
    cls
    echo Redis下载失败！

    echo 请前往 https://github.com/redis-windows/redis-windows/releases/download/7.4.2/Redis-7.4.2-Windows-x64-cygwin-with-Service.zip 进行手动下载。
    set /p Enter=
    goto skipredis
)

:redis2
cls
echo 正在下载 Redis-7.4.2-Windows-x64-msys2-with-Service.zip......
call wget -O "Redis_msys2.zip" "%Mirror%/redis-windows/redis-windows/releases/download/7.4.2/Redis-7.4.2-Windows-x64-msys2-with-Service.zip" >nul
if %errorlevel% == 0 (
    cls
    echo Redis下载完成！
    set rediszip=Redis_msys2.zip
    goto redisjy
) else (
    cls
    echo Redis下载失败！

    echo 请前往 https://github.com/redis-windows/redis-windows/releases/download/7.4.2/Redis-7.4.2-Windows-x64-msys2-with-Service.zip 进行手动下载。
    set /p Enter=
    goto skipredis
)

:: 解压 Redis
:redisjy
echo 正在解压Redis......
powershell -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%rediszip%', '%CD%'); }"

if %errorlevel% neq 0 (
    echo 解压失败！可尝试手动解压该文件。
    set /p Enter=
    goto skipredis
) else (
    echo Redis已成功解压到当前目录。
    set /p Enter=
    del Redis_*.zip
)

:skipredis
cls
REM 进入 Yunzai 目录
cd Yunzai
if %errorlevel% neq 0 (
  echo 无法进入 Yunzai 目录！该目录可能并不存在！
  pause >nul
  exit /b 1
)

REM 检查是否已全局安装 pnpm
where pnpm >nul 2>&1
if %errorlevel% neq 0 (
  echo 未找到 pnpm，正在全局安装...
  cmd /c "npm install -g pnpm"
  if %errorlevel% neq 0 (
    echo 全局安装 pnpm 失败！
    pause >nul
    exit /b 1
  )
) else (
  echo 已找到 pnpm。
)

REM 安装依赖
cmd /c "pnpm install"
if %errorlevel% neq 0 (
  echo Yunzai 目录下的 pnpm install 失败！
  exit /b 1
)

cls
echo 安装完成！

echo 开始执行机器人框架必要插件安装......

pause >nul
ping 127.0.0.1 -n 4 >nul








:: 安装 YunZai 的必要插件
cls

set "gb=未执行"
set "mm=未执行"
set "trss=未执行"
set "onebot=未执行"


set "a=0"

:: 检查 Yunzai 目录是否存在
if not exist "%~dp0\Yunzai\" (
    echo 错误：Yunzai 目录不存在！
    echo 请确认脚本在正确的目录下运行。
    pause >nul
    goto end
)

:: 安装 Guoba 插件
if not exist "%~dp0\Yunzai\plugins\Guoba-Plugin\" (
    echo 开始安装 Guoba 插件（YunZai 的插件管理）
    cd /d "%~dp0/Yunzai"
    git clone "https://gitee.com/guoba-yunzai/guoba-plugin.git" ./plugins/Guoba-Plugin
    if %errorlevel% neq 0 (
        echo Guoba-Plugin 安装失败！
        set "gb=%errorlevel%"
    ) else (
        echo Guoba-Plugin 已成功安装！
        set "gb=0"
        set /a a+=1
    )
) else (
    echo 检测到 Guoba-Plugin 已安装！
    set "gb=1"
    set /a a+=1
)
echo 按回车以继续......
pause >nul
cls
ping 127.0.0.1 -n 2 >nul

:: 安装 Miao 插件
if exist "%~dp0\Yunzai\plugins\Miao-Plugin\" (
    echo 检测到 Miao-Plugin 已安装！
    set "mm=1"
    set /a a+=1
) else (
    echo 开始安装 喵喵插件（YunZai 的帮助菜单）
    cd /d "%~dp0\Yunzai\"
    git clone "https://gitee.com/yoimiya-kokomi/miao-plugin.git" ./plugins/Miao-Plugin
    if %errorlevel% neq 0 (
        echo Miao-Plugin 安装失败！
        set "mm=%errorlevel%"
    ) else (
        echo Miao-Plugin 已成功安装！
        set "mm=0"
        set /a a+=1
    )
)

echo 按回车以继续......
pause >nul
cls
ping 127.0.0.1 -n 2 >nul


:: 安装 TRSS-Plugin
if not exist "%~dp0\Yunzai\plugins\TRSS-Plugin\" (
    echo 开始安装 TRSS 插件（YunZai 的远程指令）
    cd /d "%~dp0\Yunzai\"
    git clone "https://gitee.com/TimeRainStarSky/TRSS-Plugin.git" ./plugins/TRSS-Plugin
    if %errorlevel% == 0 (
        echo TRSS-Plugin 已成功安装！
        set "trss=0"
        set /a a+=1
    ) else (
        echo TRSS-Plugin 安装失败！
        set "trss=%errorlevel%"
    )
) else (
    echo 检测到 TRSS-Plugin 已安装！
    set "trss=1"
    set /a a+=1
)

echo 按回车以继续......
pause >nul
cls
ping 127.0.0.1 -n 2 >nul


:: 安装 OneBot 插件
set onebotpath="%~dp0\Koishi\node_modules\koishi-plugin-adapter-onebot\"

if not exist "%~dp0\Koishi\" (
    echo 错误：Koishi 目录不存在！
    echo 请确认脚本在正确的目录下运行。
) else if exist "%onebotpath%" (
    echo 检测到 OneBot-Plugin 已安装！
    set "onebot=1"
    set /a a+=1
) else (
    echo 开始安装 OneBot 适配器......
    start "OneBot" cmd /wait /c "cd /d %~dp0\Koishi\ && npm i koishi-plugin-adapter-onebot && exit >nul"
    ping 127.0.0.1 -n 8 >nul
    echo OneBot 安装成功！
    set "onebot=0"
    set /a a+=1
    )
)

echo 按回车以继续......

pause >nul
cls



:end0
echo 0：成功！    ≠0/1：失败！    1：检测到已安装

echo ——————————————————————————————————————————

if not "%gb%"==0 echo Yunzai框架_Guoba-Plugin 错误代码：%gb%

if not "%mm%"==0 echo Yunzai框架_Miao-Plugin 错误代码：%mm%

if not "%trss%"==0 echo Yunzai框架_TRSS-Plugin 错误代码：%trss%

if not "%onebot%"==0 echo Koishi框架_OneBot-Plugin 错误代码：%onebot%

echo ——————————————————————————————————————————


echo 所有必要插件已安装 (4/%a%)

:: 在脚本末尾暂停，等待用户按键
pause >nul