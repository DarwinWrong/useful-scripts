@echo off
powershell -ExecutionPolicy Bypass -Command "& '%~dp0disable_services_and_block_process.ps1'"
pause