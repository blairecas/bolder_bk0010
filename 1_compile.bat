@echo off

echo.
echo Graphics V2
echo ===========================================================================
php -f convert_spr.php ./graphics/Tiles1.png
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f convert_font.php
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo Compiling and pack CPU
echo ===========================================================================
php -f ../scripts/preprocess.php cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11.exe -ysl 32 -yus -l _cpu.lst _cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ../scripts/lst2bin.php _cpu.lst _cpu.bin bin 1000
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\zx0 -f -q _cpu.bin _cpu_lz.bin

echo.
echo Compiling BOLDE3
echo ===========================================================================
php -f ../scripts/preprocess.php bolde3.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11.exe -ysl 32 -yus -l _bolde3.lst _bolde3.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ../scripts/lst2bin.php _bolde3.lst ./release/bolde3.bin bbk 2000
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ../scripts/bin2wav.php ./release/bolde3.bin
if %ERRORLEVEL% NEQ 0 ( exit /b )

start ..\..\bkemu\BK_x64.exe /C BK-0010-01 /B .\release\bolde3.bin

echo.