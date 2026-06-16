@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
set LOGFILE=%~dp0process_log.txt

:: Старт логування
powershell -Command "Add-Content -Path '%LOGFILE%' -Value ('Час запуску перевірки: ' + (Get-Date -Format 'dd.MM.yyyy HH:mm:ss')) -Encoding UTF8"

:: Запуск PowerShell, який логить у файл у реальному часі
powershell -NoExit -Command ^
  "$logfile = '%LOGFILE%'; " ^
  "Register-WmiEvent -Class Win32_ProcessStartTrace -Action { " ^
  "    $time = Get-Date -Format 'dd.MM.yyyy HH:mm:ss'; " ^
  "    $procName = $Event.SourceEventArgs.NewEvent.ProcessName; " ^
  "    $pid = $Event.SourceEventArgs.NewEvent.ProcessId; " ^
  "    $path = (Get-Process -Id $pid -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path) -join ''; " ^
  "    if (-not $path) { $path = 'невідомо' } " ^
  "    $line = '{0} - {1} - ще працює - {2}' -f $procName,$time,$path; " ^
  "    Add-Content -Path $logfile -Value $line -Encoding UTF8; " ^
  "    Write-Host ('Новий процес: ' + $line) -ForegroundColor Green; " ^
  "}; " ^
  "Register-WmiEvent -Class Win32_ProcessStopTrace -Action { " ^
  "    $time = Get-Date -Format 'dd.MM.yyyy HH:mm:ss'; " ^
  "    $procName = $Event.SourceEventArgs.NewEvent.ProcessName; " ^
  "    $line = '{0} - ? - {1} - завершено' -f $procName,$time; " ^
  "    Add-Content -Path $logfile -Value $line -Encoding UTF8; " ^
  "    Write-Host ('Завершився процес: ' + $line) -ForegroundColor Red; " ^
  "}; " ^
  "Write-Host 'Відслідковування процесів запущене. Натисни Ctrl+C щоб завершити.' -ForegroundColor Yellow; " ^
  "while ($true) { Wait-Event | Out-Null }"

:: Коли вийдеш Ctrl+C, додаємо час завершення
powershell -Command "Add-Content -Path '%LOGFILE%' -Value ('Час закінчення перевірки: ' + (Get-Date -Format 'dd.MM.yyyy HH:mm:ss')) -Encoding UTF8"

pause
