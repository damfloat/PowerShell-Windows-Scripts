Write-Host "Resetting network settings..." -ForegroundColor Cyan

Write-Host "Flushing DNS cache..."
ipconfig /flushdns

Write-Host "Resetting TCP/IP stack..."
netsh int ip reset

Write-Host "Resetting Winsock..."
netsh winsock reset

Write-Host "Restarting network adapters..."
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
foreach ($adapter in $adapters) {
    Write-Host "Disabling adapter: $($adapter.Name)"
    Disable-NetAdapter -Name $adapter.Name -Confirm:$false
    Start-Sleep -Seconds 2
    Write-Host "Enabling adapter: $($adapter.Name)"
    Enable-NetAdapter -Name $adapter.Name -Confirm:$false
}

Write-Host "`nNetwork reset complete. You may need to restart your computer." -ForegroundColor Green
