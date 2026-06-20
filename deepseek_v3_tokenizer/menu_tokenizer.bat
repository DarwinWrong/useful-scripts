@echo off
rem ------------------------------------------------------------
rem Menu for DeepSeek token counter using the virtual environment
rem ------------------------------------------------------------

:: Activate the virtual environment
call venv\Scripts\activate.bat

:menu
cls
echo ==============================
echo DeepSeek Token Counter Menu
echo ==============================
echo.
echo 1. Count tokens from a text string
echo 2. Count tokens from a file
echo 3. Exit
echo.
set /p choice=Choose an option (1-3): 

if "%choice%"=="1" goto :text
if "%choice%"=="2" goto :file
if "%choice%"=="3" goto :exit

echo Invalid choice. Please try again.
pause
goto :menu

:text
set /p txt=Enter the text to tokenize: 
python deepseek_tokenizer.py --text "%txt%"
rem Pause so the user can see the output
pause
goto :menu

:file
rem Prompt for file path (user may include or omit surrounding quotes)
set /p fpath=Enter the full path to the text file (no surrounding quotes needed): 
rem If the user typed quotes, strip them
if "%fpath:~0,1%"=="\"" set "fpath=%fpath:~1,-1%"
python deepseek_tokenizer.py --file "%fpath%"
rem Pause so the user can see the output
pause
goto :menu

:exit
echo Exiting.
exit /b 0

:end
rem Keep window open so you can see the output
pause
