@echo off
chcp 65001 > nul setlocal enabledelayedexpansion
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0SaveOpenFolders.ps1"
pause