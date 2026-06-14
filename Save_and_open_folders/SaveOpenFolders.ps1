# Отримати шлях до папки скрипта
$scriptFolder = Split-Path -Parent $MyInvocation.MyCommand.Definition
$filePath = Join-Path $scriptFolder "open_folders.txt"

function Save-OpenFolders {
    $windows = New-Object -ComObject Shell.Application
    $paths = @()
    foreach ($window in $windows.Windows()) {
        try {
            $folderPath = $window.Document.Folder.Self.Path
            if ($folderPath) { $paths += $folderPath }
        } catch {
            # Ігноруємо вікна, які не є папками
        }
    }
    $paths = $paths | Sort-Object -Unique
    $paths | Out-File -FilePath $filePath -Encoding UTF8
    Write-Host "`nOpened folders are saved in $filePath"
}

function Open-SavedFolders {
    if (Test-Path $filePath) {
        $paths = Get-Content $filePath
        foreach ($p in $paths) {
            if (Test-Path $p) {
                Start-Process explorer.exe $p
            }
        }
        Write-Host "`nAll folders are opened."
    } else {
        Write-Host "`nFile $filePath not found."
    }
}

# Меню
while ($true) {
    Write-Host "============================"
    Write-Host "1) Save opened folders"
    Write-Host "2) Open saved folders"
    Write-Host "3) Exit"
    Write-Host "============================"
    $choice = Read-Host "Choose (1-3)"
    
    switch ($choice) {
        "1" { Save-OpenFolders }
        "2" { Open-SavedFolders }
        "3" { break }
        default { Write-Host "Try again." }
    }
}
