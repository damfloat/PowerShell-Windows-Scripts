Write-Host "Select an action:"
Write-Host "1. Restore the classic context menu (like in Windows 10)"
Write-Host "2. Enable the new context menu (Windows 11 default)"
$choice = Read-Host "Enter 1 or 2"

$keyPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"

if ($choice -eq "1") {
    New-Item -Path $keyPath -Force | Out-Null
    New-Item -Path "$keyPath\InprocServer32" -Force | Out-Null
    Set-ItemProperty -Path "$keyPath\InprocServer32" -Name "(default)" -Value "" -Force
    Write-Host "Classic context menu has been enabled."
}
elseif ($choice -eq "2") {
    Remove-Item -Path $keyPath -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "New context menu has been restored."
}
else {
    Write-Host "Invalid choice. Exiting script."
    exit
}

Write-Host "Restarting Explorer..."
Stop-Process -Name explorer -Force
Start-Process explorer
