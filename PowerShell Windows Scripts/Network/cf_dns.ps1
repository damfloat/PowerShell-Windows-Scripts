# Cloudflare + Google
$dnsServers = @("1.1.1.1", "8.8.8.8")

$adapters = Get-DnsClient | Where-Object { $_.InterfaceAlias -ne "Loopback Pseudo-Interface" -and $_.InterfaceAlias -ne "isatap*" }

foreach ($adapter in $adapters) {
    $interfaceAlias = $adapter.InterfaceAlias
    Write-Host "Setting DNS for adapter: $interfaceAlias"

    try {
        Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ServerAddresses $dnsServers -ErrorAction Stop
        Write-Host "DNS set to 1.1.1.1, 8.8.8.8"
    } catch {
        Write-Host "Failed to set DNS for $interfaceAlias: $_"
    }
}

Write-Host "`nCurrent DNS settings:"
Get-DnsClientServerAddress | Where-Object {$_.ServerAddresses} | Format-Table InterfaceAlias, ServerAddresses -AutoSize
