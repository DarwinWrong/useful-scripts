# EN

# INSTRUCTIONS: Run scripts with admin rights

1) The script disable_services_and_block_process.ps1 and disable_services_and_block_process.bat disable unnecessary services in Windows 10-11

A script with the extension .bat runs a powershell script with the same name .ps1

### These scripts allow you to disable unnecessary services and processes that can load the system:

- Intel(R) System Usage Report (SystemUsageReportSvc_QUEENCREEK)
- Energy Server Service queencreek (esrv_svc_queencreek)
- CrossDeviceResume.exe

STEPS FOR USE:

1. Download the files:
- Make sure you have two files:
• disable_services_and_block_process.ps1
• disable_services_and_block_process.bat
- Both files must be in the same folder (for example, Downloads).

2. Run the script:
- Right-click on the disable_services_and_block_process.bat file.
- Select “Run as administrator”.
- A PowerShell window will open, which will perform actions to disable services.

3. What the script does:
- Stops and disables the SystemUsageReportSvc_QUEENCREEK service.
- Stops and disables the esrv_svc_queencreek service.
- Terminates the CrossDeviceResume.exe process, if it is active.
- Adds an entry to the Windows registry to block the launch of CrossDeviceResume.exe in the future.

4. After completion:
- The message “Done!” will appear in the window.
- Press any key to close the window.

5. Recommendation:
- After running the script, restart the computer for the changes to take effect.

!ATTENTION:
- The script must be run only as an administrator.
- If the service is already missing, the script will simply skip it without an error.

2) The disable-services-en.bat script calls disable-services-en.ps1 and stops or removes, at your discretion, the following services of Windows 10-11:
1. SysMain - Memory and disk optimization (loads CPU)
2. WSearch - File indexing for search (loads disk)
3. WMPNetworkSvc - Network media sharing
4. XboxGipSvc - Xbox accessory management
5. XboxLiveAuthManager - Xbox Live authentication
6. XboxLiveGameSave - Xbox game saving
7. XboxLiveNetAuthSvc - Xbox network authentication
8. DiagTrack - Telemetry and diagnostics
9. dmwappushservice - Push notifications for device management
10. WerSvc - Windows Error Reporting
11. PcaSvc - Program Compatibility Assistant
12. Spooler - Print spooler (if you don't use a printer)
13. Fax - Service fax
14. Themes - Windows Themes (to save resources)

---

# UA

# ІНСТРУКЦІЯ: Запускайте скрипти з правами адміна

Скрипт з розширеннм .bat запускає з таким ж іменем powershell скрипт .ps1

1) Cкрипт disable_services_and_block_process.ps1 та disable_services_and_block_process.bat вимикають непотрібні служби у Windows 10-11

### Ці скрипти дозволяють вимкнути непотрібні служби та процеси, які можуть навантажувати систему:

- Intel(R) System Usage Report (SystemUsageReportSvc_QUEENCREEK)
- Energy Server Service queencreek (esrv_svc_queencreek)
- CrossDeviceResume.exe

КРОКИ ВИКОРИСТАННЯ:

1. Завантаження файлів:
   - Переконайтесь, що у вас є два файли:
     • disable_services_and_block_process.ps1
     • disable_services_and_block_process.bat
   - Обидва файли повинні бути в одній папці (наприклад, Завантаження).

2. Запуск скрипта:
   - Клікніть правою кнопкою миші на файлі disable_services_and_block_process.bat.
   - Оберіть “Запустити від імені адміністратора”.
   - Відкриється вікно PowerShell, яке виконає дії з вимкнення служб.

3. Що робить скрипт:
   - Зупиняє та вимикає службу SystemUsageReportSvc_QUEENCREEK.
   - Зупиняє та вимикає службу esrv_svc_queencreek.
   - Завершує процес CrossDeviceResume.exe, якщо він активний.
   - Додає запис у реєстр Windows, щоб заблокувати запуск CrossDeviceResume.exe у майбутньому.

4. Після завершення:
   - У вікні з’явиться повідомлення “Готово!”.
   - Натисніть будь-яку клавішу, щоб закрити вікно.

5. Рекомендація:
   - Після виконання скрипта перезавантажте комп’ютер, щоб зміни набрали чинності.

!УВАГА:
- Скрипт потрібно запускати лише від імені адміністратора.
- Якщо служба вже відсутня — скрипт просто пропустить її без помилки.

2) Скрипт disable-services-ua.bat викликає disable-services-ua.ps1 та зупиняє або видаляє, на ваш вибір, наступні служби Windows 10-11: 
1. SysMain          - Оптимізація пам'яті та дисків (навантажує CPU)
2. WSearch          - Індексація файлів для пошуку (навантажує диск)
3. WMPNetworkSvc    - Спільний доступ до медіа через мережу
4. XboxGipSvc       - Управління Xbox аксесуарами
5. XboxLiveAuthManager - Автентифікація Xbox Live
6. XboxLiveGameSave - Збереження ігор Xbox
7. XboxLiveNetAuthSvc - Мережева автентифікація Xbox
8. DiagTrack        - Телеметрія та діагностика
9. dmwappushservice - Push-повідомлення для керування пристроями
10. WerSvc          - Звіт про помилки Windows
11. PcaSvc          - Асистент сумісності програм
12. Spooler         - Спулер друку (якщо не використовуєш принтер)
13. Fax             - Служба факсу
14. Themes          - Теми Windows (для економії ресурсів)