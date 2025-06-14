# Simple Dell Command Update Script - APPLY ALL UPDATES via CLI

function Find-DCU {
    $paths = @(
        "$env:ProgramFiles\Dell\CommandUpdate\dcu-cli.exe",
        "$env:ProgramFiles(x86)\Dell\CommandUpdate\dcu-cli.exe"
    )
    foreach ($p in $paths) {
        if (Test-Path $p) {
            return $p
        }
    }
    return $null
}

Write-Host "Searching for Dell Command | Update CLI..."
$dcu = Find-DCU

if (-not $dcu) {
    Write-Host "Dell Command | Update not found on this machine."
    Write-Host "Please install it manually from: https://www.dell.com/support/home/drivers"
    exit 1
} else {
    Write-Host "Dell Command | Update found at: $dcu"
}

# Start BIOS and driver update process
Write-Host "Applying available updates..."
Start-Process -FilePath $dcu -ArgumentList "/applyUpdates", "/silent", "/reboot=disable" -Wait

Write-Host "`nDell Command | Update process complete."
Write-Host "If a BIOS update was staged, it will apply after the next system reboot."
Write-Host "Please restart the system to complete the update process."
