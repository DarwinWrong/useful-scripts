param(
    [string]$Action = "DisableServices",
    [string]$Operation = "Disable",
    [string[]]$Services
)

# Dictionary of services with descriptions
$servicesDict = @{
    "SysMain" = "Memory and disk optimization (high CPU usage)"
    "WSearch" = "File indexing for search (high disk usage)"
    "WMPNetworkSvc" = "Network media sharing"
    "XboxGipSvc" = "Xbox accessories management"
    "XboxLiveAuthManager" = "Xbox Live authentication"
    "XboxLiveGameSave" = "Xbox game saves"
    "XboxLiveNetAuthSvc" = "Xbox network authentication"
    "DiagTrack" = "Telemetry and diagnostics"
    "dmwappushservice" = "Push notifications for device management"
    "WerSvc" = "Windows Error Reporting"
    "PcaSvc" = "Program Compatibility Assistant"
    "Spooler" = "Print spooler (if you don't use a printer)"
    "Fax" = "Fax service"
    "Themes" = "Windows themes (to save resources)"
}

# Function to process services
function Process-Services {
    param([string]$operation, [string[]]$services)

    foreach ($service in $services) {
        try {
            if ($operation -eq "Disable") {
                Set-Service -Name $service -StartupType Disabled -ErrorAction Stop
                Stop-Service -Name $service -ErrorAction SilentlyContinue
                Write-Host "Disabled service: $service"
            } elseif ($operation -eq "Delete") {
                sc.exe delete $service
                Write-Host "Deleted service: $service"
            }
        } catch {
            Write-Host "Error during $operation of service $service : $($_.Exception.Message)"
        }
    }
}

# Execution based on action
switch ($Action) {
    "ProcessServices" {
        if ($Services -and $Operation) {
            Process-Services -operation $Operation -services $Services
        } else {
            Write-Host "You must specify -Services and -Operation (Disable or Delete)"
        }
    }
    default {
        Write-Host "Unknown action. Use -Action ProcessServices with -Services and -Operation"
    }
}