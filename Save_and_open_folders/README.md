# EN

# Open Folders Script

## Description
This repository contains a set of scripts that collect the list of all currently open Windows folders into a plain text file and provide an easy way to reopen them later.

## Summary
- **open_folders.txt** – file containing absolute paths of the open folders.
- **SaveOpenFolders.ps1** – PowerShell script that gathers the open folders using WMI/COM objects.
- **Win_Folders_Manager.bat** – batch script that calls the PowerShell script and opens the folders listed in `open_folders.txt`.

## Requirements
- Windows 10/11 with PowerShell >= 5.1.
- No additional external dependencies.

## Usage
1. **Run the collection script**
   ```bash
   .\SaveOpenFolders.ps1
   ```
   After execution, `open_folders.txt` will be created/updated in the current directory.

2. **Run the window manager**
   ```cmd
   Win_Folders_Manager.bat
   ```
   The script reads `open_folders.txt` and opens each folder in a new Windows window.

## Code
- **open_folders.txt** – simple text file; each line is an absolute folder path.
- **SaveOpenFolders.ps1** – obtains the list of open folders via `Get-Item`/`Get-Process`, then writes to `open_folders.txt`.
- **Win_Folders_Manager.bat** – batch wrapper that calls the PowerShell script.

Example
```powershell
$processes = Get-Process
foreach ($p in $processes) {
    # logic to find open folders (e.g., those with a specific WMI attribute)
}
Out-File -FilePath "open_folders.txt" -Encoding utf8
```

## Author
Author: `godin`.  

---
# UA

# Скрипт зберігання відкритих папок

## Опис
Цей репозиторій містить простий набір скриптів, призначених для запису у файл списку усіх віконних папок, що відкриті в операційній системі Windows, та зручного відкриття їх в майбутньому. Скрипти зберігають посилання на відкриті папки у файл **open_folders.txt** і надають можливість швидко відкрити їх через PowerShell або .bat.

## Підсумок
- **Open_folders.txt** – файл з шляхами відкритих папок.
- **SaveOpenFolders.ps1** – PowerShell‑скрипт, який збирає відкриті папки за допомогою WMI/COM‑об’єктів.
- **Win_Folders_Manager.bat** – пак-скрипт, що викликає PowerShell‑скрипт і відкриває файли з **open_folders.txt**.

## Підготовка
Вимоги:
- Windows 10/11 з встановленим PowerShell (версія >=5.1). 
- Немає додаткових зовнішніх залежностей.

## Використання
1. **Запуск скрипту збірки**
   ```bash
   > .\SaveOpenFolders.ps1
   ```
   Після виконання у поточній директорії буде створено/оновлено файл `open_folders.txt`.

2. **Запуск менеджера вікон**
   ```cmd
   Win_Folders_Manager.bat
   ```
   Скрипт читає `open_folders.txt` й по черзі відкриває усі вказані папки у нових вікнах Windows.

## Код
- **open_folders.txt** — простий текстовий файл. Кожен рядок — абсолютний шлях до папки.
- **SaveOpenFolders.ps1** — скрипт, що отримує список відкритих екранів за допомогою `Get-Item`/`Get-Process` і зберігає їх у `open_folders.txt`.
- **Win_Folders_Manager.bat** — пакетний файл, який викликає PowerShell‑скрипт надалі.

```

## Автор
Автор: `godin`. Хочете побачити інші проекти? Перегляньте портфоліо на GitHub.
---