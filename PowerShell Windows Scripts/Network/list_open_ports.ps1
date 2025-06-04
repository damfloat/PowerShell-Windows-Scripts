Write-Host "Scanning all open network connections..." -ForegroundColor Cyan

$tcpConnections = Get-NetTCPConnection
$udpConnections = Get-NetUDPEndpoint

$processMap = @{}
Get-Process | ForEach-Object {
    $processMap[$_.Id] = $_.ProcessName
}

Write-Host "`nTCP Connections:" -ForegroundColor Yellow
$tcpConnections | Sort-Object -Property State | ForEach-Object {
    $procId = $_.OwningProcess

    if ($processMap.ContainsKey($procId)) {
        $procName = $processMap[$procId]
    } else {
        try {
            $proc = Get-CimInstance Win32_Process -Filter "ProcessId = $procId"
            $procName = if ($proc) { $proc.Name } else { "Unknown" }
        } catch {
            $procName = "Unknown"
        }
    }

    $local = "$($_.LocalAddress):$($_.LocalPort)"
    $remote = "$($_.RemoteAddress):$($_.RemotePort)"
    $state = $_.State
    $output = "{0,-22} {1,-22} {2,-13} PID: {3,-6} {4}" -f $local, $remote, $state, $procId, $procName
    Write-Host $output
}

Write-Host "`nUDP Endpoints:" -ForegroundColor Yellow
$udpConnections | ForEach-Object {
    $procId = $_.OwningProcess

    if ($processMap.ContainsKey($procId)) {
        $procName = $processMap[$procId]
    } else {
        try {
            $proc = Get-CimInstance Win32_Process -Filter "ProcessId = $procId"
            $procName = if ($proc) { $proc.Name } else { "Unknown" }
        } catch {
            $procName = "Unknown"
        }
    }

    $local = "$($_.LocalAddress):$($_.LocalPort)"
    $output = "{0,-22} PID: {1,-6} {2}" -f $local, $procId, $procName
    Write-Host $output
}
