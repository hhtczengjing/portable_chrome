@ECHO OFF
chcp 65001
cls

@SETLOCAL

echo "========请先设置7-zip安装目录========"
echo.

set PATH=D:\Program Files\7-Zip;%PATH%
set GCP_PKG_NAME=GoogleChromePortable_128.0.6613.120_online.paf.exe
set CHROME_PKG_NAME=49.0.2623.75_chrome64_stable_windows_installer.exe
set CHROME_VERSION=49.0.2623.75
set PRODUCT_NAME=Chrome_%CHROME_VERSION%

echo "创建文件夹结构"
if exist %PRODUCT_NAME% rd /s /Q %PRODUCT_NAME%
md %PRODUCT_NAME%\App

echo "提取GoogleChromePortable.exe"
7z e %GCP_PKG_NAME% GoogleChromePortable.exe -aoa -o%PRODUCT_NAME%

echo "提取chrome.7z\Chrome-bin"
7z e %CHROME_PKG_NAME% chrome.7z -aoa -o%PRODUCT_NAME%
7z x %PRODUCT_NAME%\chrome.7z -aoa -o%PRODUCT_NAME%\App
del /a %PRODUCT_NAME%\chrome.7z

echo "生成压缩文件"
7z a %PRODUCT_NAME%.7z %PRODUCT_NAME%

@ENDLOCAL

pause