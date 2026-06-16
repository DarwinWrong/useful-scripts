@echo off
setlocal enabledelayedexpansion
set LOGFILE=%~dp0process_log.txt

:: Start logging
powershell -Command "Add-Content -Path '%LOGFILE%' -Value ('Check start time: ' + (Get-Date -Format 'dd.MM.yyyy HH:mm:ss')) -Encoding UTF8"

:: Running PowerShell that logs to a file in real time
powershell -NoExit -Command ^
  "$logfile = '%LOGFILE%'; " ^
  "Register-WmiEvent -Class Win32_ProcessStartTrace -Action { " ^
  "    $time = Get-Date -Format 'dd.MM.yyyy HH:mm:ss'; " ^
  "    $procName = $Event.SourceEventArgs.NewEvent.ProcessName; " ^
  "    $pid = $Event.SourceEventArgs.NewEvent.ProcessId; " ^
  "    $path = (Get-Process -Id $pid -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path) -join ''; " ^
  "    if (-not $path) { $path = 'невідомо' } " ^
  "    $line = '{0} - {1} - still working - {2}' -f $procName,$time,$path; " ^
  "    Add-Content -Path $logfile -Value $line -Encoding UTF8; " ^
  "    Write-Host ('Новий процес: ' + $line) -ForegroundColor Green; " ^
  "}; " ^
  "Register-WmiEvent -Class Win32_ProcessStopTrace -Action { " ^
  "    $time = Get-Date -Format 'dd.MM.yyyy HH:mm:ss'; " ^
  "    $procName = $Event.SourceEventArgs.NewEvent.ProcessName; " ^
  "    $line = '{0} - ? - {1} - completed' -f $procName,$time; " ^
  "    Add-Content -Path $logfile -Value $line -Encoding UTF8; " ^
  "    Write-Host ('The process is complete: ' + $line) -ForegroundColor Red; " ^
  "}; " ^
  "Write-Host 'Process tracing is running. Press Ctrl+C to exit.' -ForegroundColor Yellow; " ^
  "while ($true) { Wait-Event | Out-Null }"

:: When you exit Ctrl+C, add the end time.
powershell -Command "Add-Content -Path '%LOGFILE%' -Value ('Check end time: ' + (Get-Date -Format 'dd.MM.yyyy HH:mm:ss')) -Encoding UTF8"

pause
