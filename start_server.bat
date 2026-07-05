@echo off
title TerraDirect Web Server Launcher
cd /d "%~dp0"
echo ==========================================================
echo    TerraDirect Web Server Launcher
echo ==========================================================
echo.
echo Starting local web server...
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0start_server.ps1"
echo.
echo Server closed.
pause
