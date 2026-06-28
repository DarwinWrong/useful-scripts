@echo off
setlocal Enable Extensions EnableDelayedExpansion
chcp 65001 >nul
title AI CLI Control Panel

:menu
cls
echo ==========================================
echo            AI CLI CONTROL PANEL
echo ==========================================
echo.
echo [1] Run Programs
echo [2] Install Programs
echo [3] Update Programs
echo [4] Uninstall Programs
echo [0] Exit
echo.
set /p main_choice=Select section:

if "%main_choice%"=="1" goto run_menu
if "%main_choice%"=="2" goto install_menu
if "%main_choice%"=="3" goto update_menu
if "%main_choice%"=="4" goto uninstall_menu
if "%main_choice%"=="0" exit /b 0

echo Invalid selection.
pause
goto menu


:run_menu
cls
echo ==========================================
echo              RUN PROGRAMS
echo ==========================================
echo [1] qwen-code cli
echo [2] copilot cli
echo [3] gemini-cli
echo [4] codex
echo [5] claude-code
echo [6] omniroute
echo [7] openhands
echo [0] Back
echo.
set /p run_choice=Select program:

if "%run_choice%"=="1" goto run_qwen
if "%run_choice%"=="2" goto run_copilot
if "%run_choice%"=="3" goto run_gemini
if "%run_choice%"=="4" goto run_codex
if "%run_choice%"=="5" goto run_claude
if "%run_choice%"=="6" goto run_omniroute
if "%run_choice%"=="7" goto run_openhands
if "%run_choice%"=="0" goto menu

echo Invalid selection.
pause
goto run_menu


:install_menu
cls
echo ==========================================
echo             INSTALL PROGRAMS
echo ==========================================
echo [1] qwen-code cli
echo [2] copilot cli
echo [3] gemini-cli
echo [4] codex
echo [5] claude-code
echo [6] omniroute
echo [7] openhands
echo [8] clawhub
echo [0] Back
echo.
set /p install_choice=Select program:

if "%install_choice%"=="1" goto install_qwen
if "%install_choice%"=="2" goto install_copilot
if "%install_choice%"=="3" goto install_gemini
if "%install_choice%"=="4" goto install_codex
if "%install_choice%"=="5" goto install_claude
if "%install_choice%"=="6" goto install_omniroute
if "%install_choice%"=="7" goto install_openhands
if "%install_choice%"=="8" goto install_clawhub
if "%install_choice%"=="0" goto menu

echo Invalid selection.
pause
goto install_menu


:update_menu
cls
echo ==========================================
echo              UPDATE PROGRAMS
echo ==========================================
echo [1] qwen-code cli
echo [2] copilot cli
echo [3] gemini-cli
echo [4] codex
echo [5] claude-code
echo [6] omniroute
echo [7] openhands
echo [8] clawhub
echo [0] Back
echo.
set /p update_choice=Select program:

if "%update_choice%"=="1" goto update_qwen
if "%update_choice%"=="2" goto update_copilot
if "%update_choice%"=="3" goto update_gemini
if "%update_choice%"=="4" goto update_codex
if "%update_choice%"=="5" goto update_claude
if "%update_choice%"=="6" goto update_omniroute
if "%update_choice%"=="7" goto update_openhands
if "%update_choice%"=="8" goto update_clawhub
if "%update_choice%"=="0" goto menu

echo Invalid selection.
pause
goto update_menu


:uninstall_menu
cls
echo ==========================================
echo             UNINSTALL PROGRAMS
echo ==========================================
echo [1] qwen-code cli
echo [2] copilot cli
echo [3] gemini-cli
echo [4] codex
echo [5] claude-code
echo [6] omniroute
echo [7] openhands
echo [8] clawhub
echo [0] Back
echo.
set /p uninstall_choice=Select program:

if "%uninstall_choice%"=="1" goto uninstall_qwen
if "%uninstall_choice%"=="2" goto uninstall_copilot
if "%uninstall_choice%"=="3" goto uninstall_gemini
if "%uninstall_choice%"=="4" goto uninstall_codex
if "%uninstall_choice%"=="5" goto uninstall_claude
if "%uninstall_choice%"=="6" goto uninstall_omniroute
if "%uninstall_choice%"=="7" goto uninstall_openhands
if "%uninstall_choice%"=="8" goto uninstall_clawhub
if "%uninstall_choice%"=="0" goto menu

echo Invalid selection.
pause
goto uninstall_menu


:: =========================
:: RUN PROGRAMS
:: =========================
:run_qwen
cls
echo Running: qwen
call qwen
pause
goto menu

:run_copilot
cls
echo Running: copilot
call copilot
pause
goto menu

:run_gemini
cls
echo Running: gemini
call gemini
pause
goto menu

:run_codex
cls
echo Running: codex
call codex
pause
goto menu

:run_claude
cls
echo Running: claude
call claude
pause
goto menu

:run_omniroute
cls
echo Running: omniroute
call omniroute
pause
goto menu

:run_openhands
cls
echo Running: openhands
call openhands
pause
goto menu


:: =========================
:: INSTALL PROGRAMS
:: =========================
:install_qwen
cls
echo npm install -g @qwen-code/qwen-code@latest
call npm install -g @qwen-code/qwen-code@latest
pause
goto menu

:install_copilot
cls
echo npm install -g @github/copilot
call npm install -g @github/copilot
pause
goto menu

:install_gemini
cls
echo npm install -g @google/gemini-cli
call npm install -g @google/gemini-cli
pause
goto menu

:install_codex
cls
echo npm install -g @openai/codex
call npm install -g @openai/codex
pause
goto menu

:install_claude
cls
echo npm install -g @anthropic-ai/claude-code
call npm install -g @anthropic-ai/claude-code
pause
goto menu

:install_omniroute
cls
echo npm install -g omniroute
call npm install -g omniroute
pause
goto menu

:install_openhands
cls
echo pip install openhands
call pip install openhands
pause
goto menu

:install_clawhub
cls
echo npm install -g clawhub
call npm install -g clawhub
pause
goto menu


:: =========================
:: UPDATE PROGRAMS
:: =========================
:update_qwen
cls
echo npm update -g @qwen-code/qwen-code
call npm update -g @qwen-code/qwen-code
pause
goto menu

:update_copilot
cls
echo copilot update
call copilot update
pause
goto menu

:update_gemini
cls
echo npm update -g @google/gemini-cli
call npm install -g @google/gemini-cli
pause
goto menu

:update_codex
cls
echo npm update -g @openai/codex
call npm update -g @openai/codex
pause
goto menu

:update_claude
cls
echo claude update
call claude update
pause
goto menu

:update_omniroute
cls
echo npm update -g omniroute
call npm update -g omniroute
pause
goto menu

:update_openhands
cls
echo pip install -U openhands
call pip install -U openhands
pause
goto menu

:update_clawhub
cls
echo npm update -g clawhub
call npm update -g clawhub
pause
goto menu


:: =========================
:: UNINSTALL PROGRAMS
:: =========================
:uninstall_qwen
cls
echo npm uninstall -g @qwen-code/qwen-code
call npm uninstall -g @qwen-code/qwen-code
pause
goto menu

:uninstall_copilot
cls
echo npm uninstall -g @github/copilot
call npm uninstall -g @github/copilot
pause
goto menu

:uninstall_gemini
cls
echo npm uninstall -g @google/gemini-cli
call npm uninstall -g @google/gemini-cli
pause
goto menu

:uninstall_codex
cls
echo npm uninstall -g @openai/codex
call npm uninstall -g @openai/codex
pause
goto menu

:uninstall_claude
cls
echo npm uninstall -g @anthropic-ai/claude-code
call npm uninstall -g @anthropic-ai/claude-code
pause
goto menu

:uninstall_omniroute
cls
echo npm uninstall -g omniroute
call npm uninstall -g omniroute
pause
goto menu

:uninstall_openhands
cls
echo pip uninstall -y openhands
call pip uninstall -y openhands
pause
goto menu

:uninstall_clawhub
cls
echo npm uninstall -g clawhub
call npm uninstall -g clawhub
pause
goto menu