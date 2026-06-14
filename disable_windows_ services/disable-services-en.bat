@echo off
chcp 65001 >nul
title Windows 11 Services Management Menu

:menu
cls
echo ====================================================
echo    Windows 11 Services Management Menu
echo ====================================================
echo.
echo List of unnecessary services:
echo.
echo 1. SysMain               - Memory and disk optimization (high CPU usage)
echo 2. WSearch               - File indexing for search (high disk usage)
echo 3. WMPNetworkSvc         - Network media sharing
echo 4. XboxGipSvc            - Xbox accessories management
echo 5. XboxLiveAuthManager   - Xbox Live authentication
echo 6. XboxLiveGameSave      - Xbox game saves
echo 7. XboxLiveNetAuthSvc    - Xbox network authentication
echo 8. DiagTrack             - Telemetry and diagnostics
echo 9. dmwappushservice      - Push notifications for device management
echo 10. WerSvc               - Windows Error Reporting
echo 11. PcaSvc               - Program Compatibility Assistant
echo 12. Spooler              - Print spooler (if you don't use a printer)
echo 13. Fax                  - Fax service
echo 14. Themes               - Windows themes (to save resources)
echo.
echo Choose an action:
echo D. Disable selected services
echo R. Delete selected services (dangerous!)
echo A. Exit
echo.
set /p choice=Enter D, R, or A: 

if /i "%choice%"=="D" goto disable
if /i "%choice%"=="R" goto delete
if /i "%choice%"=="A" goto end

echo Invalid choice. Please try again.
pause
goto menu

:disable
echo Enter service numbers to disable, separated by commas (e.g., 1,2,3):
set /p services=
call :process_services %services%
powershell -ExecutionPolicy Bypass -Command "& '%~dp0disable-services-en.ps1' -Action ProcessServices -Operation Disable -Services %selected_services%"
echo Done!
pause
goto menu

:delete
echo Enter service numbers to delete, separated by commas (e.g., 1,2,3):
set /p services=
call :process_services %services%
powershell -ExecutionPolicy Bypass -Command "& '%~dp0disable-services-en.ps1' -Action ProcessServices -Operation Delete -Services %selected_services%"
echo Done!
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
echo Exiting menu.
pause