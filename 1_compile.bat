@echo off

echo.
echo ===========================================================================
echo Graphics V0
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f convert_spr.php ./graphics/Tiles0.png
..\..\php5\php.exe -c ..\..\php5\ -f convert_font.php
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Compiling V0
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f preprocess.php cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
macro11.exe -ysl 32 -yus -m sysmac.sml -l _cpu.lst _cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking V0
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f lst2bin.php _cpu.lst ./release/bolde2.bin bbk

echo.
echo ===========================================================================
echo Graphics V1
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f convert_spr.php ./graphics/Tiles1.png
..\..\php5\php.exe -c ..\..\php5\ -f convert_font.php
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Compiling V1
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f preprocess.php cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
macro11.exe -ysl 32 -yus -m sysmac.sml -l _cpu.lst _cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking V1
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f lst2bin.php _cpu.lst ./release/bolde3.bin bbk

echo.