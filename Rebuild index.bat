@echo off
title DeadCraft - Rebuild index.html
cd /d "%~dp0"
echo Packing your textures, code and sounds into index.html...
echo.
where py >nul 2>nul && (py tools\build_single.py & goto done)
where python >nul 2>nul && (python tools\build_single.py & goto done)
echo Python is not installed. Get it from https://www.python.org/downloads/ (tick "Add Python to PATH").
:done
echo.
echo Done! Refresh the game (close and reopen index.html), then upload index.html to GitHub.
pause
