@echo off

echo.
echo ===========================================================================
echo Graphics V2
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f convert_spr.php ./graphics/Tiles1.png
..\..\php5\php.exe -c ..\..\php5\ -f convert_font.php
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Compiling V2
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\preprocess.php cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11.exe -ysl 32 -yus -m ..\scripts\sysmac.sml -l _cpu.lst _cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking V2
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\lst2bin.php _cpu.lst ./release/bolde3.bin bbk 2000

echo.