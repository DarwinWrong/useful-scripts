param(
    [string]$Action = "DisableServices",
    [string]$Operation = "Disable",
    [string[]]$Services
)

# Словник служб з описами
$servicesDict = @{
    "SysMain" = "Оптимізація пам'яті та дисків (навантажує CPU)"
    "WSearch" = "Індексація файлів для пошуку (навантажує диск)"
    "WMPNetworkSvc" = "Спільний доступ до медіа через мережу"
    "XboxGipSvc" = "Управління Xbox аксесуарами"
    "XboxLiveAuthManager" = "Автентифікація Xbox Live"
    "XboxLiveGameSave" = "Збереження ігор Xbox"
    "XboxLiveNetAuthSvc" = "Мережева автентифікація Xbox"
    "DiagTrack" = "Телеметрія та діагностика"
    "dmwappushservice" = "Push-повідомлення для керування пристроями"
    "WerSvc" = "Звіт про помилки Windows"
    "PcaSvc" = "Асистент сумісності програм"
    "Spooler" = "Спулер друку (якщо не використовуєш принтер)"
    "Fax" = "Служба факсу"
    "Themes" = "Теми Windows (для економії ресурсів)"
}

# Функція для обробки служб
function Process-Services {
    param([string]$operation, [string[]]$services)

    foreach ($service in $services) {
        try {
            if ($operation -eq "Disable") {
                Set-Service -Name $service -StartupType Disabled -ErrorAction Stop
                Stop-Service -Name $service -ErrorAction SilentlyContinue
                Write-Host "Вимкнено службу: $service"
            } elseif ($operation -eq "Delete") {
                sc.exe delete $service
                Write-Host "Видалено службу: $service"
            }
        } catch {
            Write-Host "Помилка при $operation служби $service : $($_.Exception.Message)"
        }
    }
}

# Виконання залежно від дії
switch ($Action) {
    "ProcessServices" {
        if ($Services -and $Operation) {
            Process-Services -operation $Operation -services $Services
        } else {
            Write-Host "Необхідно вказати -Services та -Operation (Disable або Delete)"
        }
    }
    default {
        Write-Host "Невідома дія. Використовуйте -Action ProcessServices з -Services та -Operation"
    }
}