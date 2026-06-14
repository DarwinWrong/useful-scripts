@echo off
chcp 65001 >nul
title Меню керування службами Windows 11

:menu
cls
echo ====================================================
echo    Меню керування службами Windows 11
echo ====================================================
echo.
echo Список непотрібних служб:
echo.
echo 1. SysMain          - Оптимізація пам'яті та дисків (навантажує CPU)
echo 2. WSearch          - Індексація файлів для пошуку (навантажує диск)
echo 3. WMPNetworkSvc    - Спільний доступ до медіа через мережу
echo 4. XboxGipSvc       - Управління Xbox аксесуарами
echo 5. XboxLiveAuthManager - Автентифікація Xbox Live
echo 6. XboxLiveGameSave - Збереження ігор Xbox
echo 7. XboxLiveNetAuthSvc - Мережева автентифікація Xbox
echo 8. DiagTrack        - Телеметрія та діагностика
echo 9. dmwappushservice - Push-повідомлення для керування пристроями
echo 10. WerSvc          - Звіт про помилки Windows
echo 11. PcaSvc          - Асистент сумісності програм
echo 12. Spooler         - Спулер друку (якщо не використовуєш принтер)
echo 13. Fax             - Служба факсу
echo 14. Themes          - Теми Windows (для економії ресурсів)
echo.
echo Виберіть дію:
echo D. Вимкнути вибрані служби
echo R. Видалити вибрані служби (небезпечно!)
echo A. Вийти
echo.
set /p choice=Введіть D, R або A:

if /i "%choice%"=="D" goto disable
if /i "%choice%"=="R" goto delete
if /i "%choice%"=="A" goto end

echo Неправильний вибір. Спробуйте ще раз.
pause
goto menu

:disable
echo Введіть номери служб для вимкнення через кому (наприклад: 1,2,3):
set /p services=
call :process_services %services%
powershell -ExecutionPolicy Bypass -Command "& '%~dp0disable-services-ua.ps1' -Action ProcessServices -Operation Disable -Services %selected_services%"
echo Готово!
pause
goto menu

:delete
echo Введіть номери служб для видалення через кому (наприклад: 1,2,3):
set /p services=
call :process_services %services%
powershell -ExecutionPolicy Bypass -Command "& '%~dp0disable-services-ua.ps1' -Action ProcessServices -Operation Delete -Services %selected_services%"
echo Готово!
pause
goto menu

:process_services
set selected_services=
for %%i in (%*) do (
    if %%i==1 set selected_services=%selected_services% SysMain
    if %%i==2 set selected_services=%selected_services% WSearch
    if %%i==3 set selected_services=%selected_services% WMPNetworkSvc
    if %%i==4 set selected_services=%selected_services% XboxGipSvc
    if %%i==5 set selected_services=%selected_services% XboxLiveAuthManager
    if %%i==6 set selected_services=%selected_services% XboxLiveGameSave
    if %%i==7 set selected_services=%selected_services% XboxLiveNetAuthSvc
    if %%i==8 set selected_services=%selected_services% DiagTrack
    if %%i==9 set selected_services=%selected_services% dmwappushservice
    if %%i==10 set selected_services=%selected_services% WerSvc
    if %%i==11 set selected_services=%selected_services% PcaSvc
    if %%i==12 set selected_services=%selected_services% Spooler
    if %%i==13 set selected_services=%selected_services% Fax
    if %%i==14 set selected_services=%selected_services% Themes
)
goto :eof

:end
echo Вихід з меню.
pause