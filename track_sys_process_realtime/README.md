# Process Tracker (track-proc-realtime.bat)

## EN

### What it does
A Windows batch script that monitors all process start/stop events in real-time using WMI (`Win32_ProcessStartTrace` / `Win32_ProcessStopTrace`) and displays where the process was launched from. Every event is logged with a timestamp to `process_log.txt`, and the console output is color-coded (green = started, red = stopped, yellow = status).

### How to use
1. Run `track-proc-realtime.bat` "With Administrator Rights"
2. The script starts monitoring immediately — you'll see process events in the console
3. Press `Ctrl+C` to stop monitoring
4. Check `process_log.txt` for the full event history

---

## UA

### Що робить
Windows-скрипт, який відстежує запуск та завершення всіх процесів у реальному часі через WMI-події (`Win32_ProcessStartTrace` / `Win32_ProcessStopTrace`) та відображає звідки запущено процес. Кожна подія записується в `process_log.txt` з міткою часу, а в консолі виводиться кольоровий лог: зелений — процес запустився, червоний — завершився, жовтий — статус.

### Як користуватись
1. Запустіть `track-proc-realtime.bat` "З правами адміністратора"
2. Моніторинг починається одразу — в консолі з'являться події процесів
3. Натисніть `Ctrl+C` щоб зупинити відстеження
4. Відкрийте `process_log.txt` щоб переглянути повну історію подій