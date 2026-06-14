@echo off
chcp 1251 >nul
setlocal
:: setlocal enabledelayedexpansion
:: setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:: Назва Python-скрипту (змініть, якщо ім'я інше)
set SCRIPT_NAME=create_structure_ua.py

:: Перевірка, чи існує скрипт
if not exist "%SCRIPT_NAME%" (
    echo [ПОМИЛКА] Скрипт %SCRIPT_NAME% не знайдено в поточній директорії.
    echo Будь ласка, розмістіть скрипт поруч з цим BAT-файлом.
    pause
    exit /b 1
)

:: Перевірка наявності Python
python --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ПОМИЛКА] Python не знайдено в системному шляху.
    echo Завантажте та встановіть Python з https://www.python.org/downloads/
    echo Після встановлення запустіть цей файл знову.
    pause
    exit /b 2
)

:: Запуск скрипту з усіма аргументами, переданими BAT-файлу
python "%SCRIPT_NAME%" %*

if %ERRORLEVEL% equ 0 (
    echo.
    echo Готово. Структура створена.
) else (
    echo.
    echo Виникла помилка під час виконання скрипту. Перевірте лог вище.
)

echo.
pause
endlocal