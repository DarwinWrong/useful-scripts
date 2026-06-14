# Check admin rights
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❌ Run it from admin." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit
}

# Stop служби Intel System Usage Report через cmd
Write-Host "Stop SystemUsageReportSvc_QUEENCREEK..."
cmd /c "sc stop SystemUsageReportSvc_QUEENCREEK"
cmd /c "sc config SystemUsageReportSvc_QUEENCREEK start= disabled"

# Stop Energy Server Service queencreek через cmd
Write-Host "Stop Energy Server Service queencreek..."
cmd /c "sc stop esrv_svc_queencreek"
cmd /c "sc config esrv_svc_queencreek start= disabled"

# Вимкнення CrossDeviceResume.exe
Write-Host "Вимкнення CrossDeviceResume.exe..."
Get-Process "CrossDeviceResume" -ErrorAction SilentlyContinue | Stop-Process -Force

# Block CrossDeviceResume.exe from regedit
Write-Host "Block CrossDeviceResume.exe from regedit"

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
If (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Create subkey DisallowRun
$subKey = "$regPath\DisallowRun"
If (!(Test-Path $subKey)) {
    New-Item -Path $subKey -Force | Out-Null
}

# Set block policy
New-ItemProperty -Path $regPath -Name "DisallowRun" -PropertyType DWord -Value 1 -Force | Out-Null
New-ItemProperty -Path $subKey -Name "1" -PropertyType String -Value "CrossDeviceResume.exe" -Force | Out-Null

Write-Host "✅ Done!" -ForegroundColor Green
Read-Host "Press Enter to close"
