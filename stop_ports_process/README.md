# EN

# Stop Ports Process

A collection of scripts to terminate processes listening on specific ports on Windows.

## Scripts

| File | Description |
|------|-------------|
| `kill-ports.ps1` | PowerShell script for stopping processes by port |
| `kill-ports.bat` | Batch wrapper that auto-requests admin rights |

---

## Usage

### Method 1: Via Batch (Recommended)

1. Right-click `kill-ports.bat`
2. Select **"Run as administrator"**
3. Enter the port number(s) when prompted (separate multiple ports with spaces)
4. Press Enter

```
Enter ports: 3000 8080 5173
```

### Method 2: Via PowerShell directly

1. Open PowerShell as Administrator
2. Run:
```powershell
.\kill-ports.ps1
```
3. Enter the port number(s) when prompted

### What the script does

1. Checks if the specified port is in use (listening state)
2. If in use — finds the process ID(s) using the port
3. Terminates those processes
4. Re-checks to confirm the port is free
5. If the port is still occupied — displays detailed process info (PID, name, path, command line, owner)

---

## File Structure

```
stop_ports_process/
├── kill-ports.bat        # Batch wrapper (auto-elevates)
├── kill-ports.ps1        # PowerShell script
└── README.md             # This file
```

---

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success — port(s) freed |
| 1 | Port(s) still in use after termination attempt |

---

## Troubleshooting

| Problem | Solution |
|---------|---------|
| Access denied | Run as Administrator |
| Port still in use | The process may be protected; check process info output |
| Script freezes | Some processes require time to terminate; wait a few seconds |

---

# UA

# Зупинка процесів на портах

Набір скриптів для завершення процесів, що слухають певні порти в Windows.

## Скрипти

| Файл | Опис |
|------|------|
| `kill-ports.ps1` | PowerShell-скрипт для зупинки процесів за портом |
| `kill-ports.bat` | Batch-обгортка з автоматичним запитом прав адміна |

---

## Використання

### Спосіб 1: Через Batch (Рекомендовано)

1. Клікніть правою кнопкою миші на `kill-ports.bat`
2. Виберіть **"Запустити від імені адміністратора"**
3. Введіть номер(и) порту, коли з'явиться запит (для кількох портів використовуйте пробіл)
4. Натисніть Enter

```
Enter ports: 3000 8080 5173
```

### Спосіб 2: Безпосередньо через PowerShell

1. Відкрийте PowerShell від імені адміністратора
2. Виконайте:
```powershell
.\kill-ports.ps1
```
3. Введіть номер(и) порту, коли з'явиться запит

### Що робить скрипт

1. Перевіряє, чи вказаний порт використовується (стан "listen")
2. Якщо порт зайнятий — знаходить ID процесу(ів), які його використовують
3. Зупиняє ці процеси
4. Повторно перевіряє, чи порт звільнений
5. Якщо порт все ще зайнятий — показує детальну інформацію про процес (PID, ім'я, шлях, командний рядок, власник)

---

## Структура файлів

```
stop_ports_process/
├── kill-ports.bat        # Batch-обгортка (автопідвищення прав)
├── kill-ports.ps1        # PowerShell-скрипт
└── README.md             # Цей файл
```

---

## Коди виходу

| Код | Значення |
|-----|----------|
| 0 | Успіх — порт(и) звільнено |
| 1 | Порт(и) все ще використовуються після спроби зупинки |

---

## Вирішення проблем

| Проблема | Рішення |
|----------|---------|
| Access denied | Запустіть від імені адміністратора |
| Порт все ще зайнятий | Процес може бути захищений; перегляньте вивід інформації |
| Скрипт зависає | Деякі процеси потребують часу на завершення; зачекайте кілька секунд |

---