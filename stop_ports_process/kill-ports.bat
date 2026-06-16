@echo off
cd /d "%~dp0"

:: перевірка на адміна
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting admin rights...
    powershell -Command "Start-Process cmd -ArgumentList '/c cd /d \"%~dp0\" && kill-ports.bat' -Verb RunAs"
    exit
)

powershell -NoProfile -ExecutionPolicy Bypass -File "kill-ports.ps1"

pause