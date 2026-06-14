@echo off
setlocal

set SCRIPT_NAME=create_structure_en.py

if not exist "%SCRIPT_NAME%" (
    echo [ERROR] Script %SCRIPT_NAME% not found in current directory.
    echo Please place the script next to this BAT file.
    pause
    exit /b 1
)

python --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Python is not installed or not in PATH.
    echo Download and install Python from https://www.python.org/downloads/
    echo Then run this file again.
    pause
    exit /b 2
)

python "%SCRIPT_NAME%" %*

if %ERRORLEVEL% equ 0 (
    echo.
    echo Done. Project structure created successfully.
) else (
    echo.
    echo An error occurred during script execution. See log above.
)

pause