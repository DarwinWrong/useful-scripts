$ports = (Read-Host "Enter ports").Split(" ")

foreach ($port in $ports) {
    Write-Host "Processing port $port..."

    $connections = Get-NetTCPConnection -LocalPort $port -State Listen -ErrorAction SilentlyContinue

    if (-not $connections) {
        Write-Host "Port $port is free"
        continue
    }

    $processIds = $connections | Select-Object -ExpandProperty OwningProcess -Unique

    foreach ($procId in $processIds) {
        $process = Get-Process -Id $procId -ErrorAction SilentlyContinue
        if ($process) {
            Write-Host "Stopping PID $procId ($($process.ProcessName))"
            Stop-Process -Id $procId -Force -ErrorAction SilentlyContinue
        }
    }

    # повторна перевірка
    $stillUsed = Get-NetTCPConnection -LocalPort $port -State Listen -ErrorAction SilentlyContinue

    if (-not $stillUsed) {
        Write-Host "Port $port is now free"
    } else {
        Write-Host "Port $port is still in use by PID(s): $($stillUsed.OwningProcess -join ', ')"

        foreach ($procId in $stillUsed.OwningProcess | Sort-Object -Unique) {
            $procInfo = Get-CimInstance Win32_Process -Filter "ProcessId = $procId" -ErrorAction SilentlyContinue
            if ($procInfo) {
                $owner = $procInfo.GetOwner()
                Write-Host "PID: $($procInfo.ProcessId)"
                Write-Host "Name: $($procInfo.Name)"
                Write-Host "Path: $($procInfo.ExecutablePath)"
                Write-Host "CommandLine: $($procInfo.CommandLine)"
                Write-Host "Owner: $($owner.User)\$($owner.Domain)"
                Write-Host "-----------------------------"
            } else {
                # fallback через tasklist
                $task = tasklist /FI "PID eq $procId" /FO LIST
                Write-Host "PID $procId info via tasklist:"
                Write-Host $task
                Write-Host "-----------------------------"
            }
        }
    }
}