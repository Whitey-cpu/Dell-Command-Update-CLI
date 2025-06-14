# Dell-Command-Update-CLI
# Dell BIOS & Driver Update Script

PowerShell script that uses Dell Command | Update (DCU) to silently apply BIOS and driver updates. If DCU isn't installed, it'll grab it from Dell and install it before running.

## What it does
- Checks for Dell Command | Update (dcu-cli.exe)
- Automatically installs it if missing
- Runs `/applyUpdates /silent /reboot=disable`
- BIOS updates will apply after the next reboot
- No logs, just output to the console

## Usage
Run this as system:

```powershell
powershell -ExecutionPolicy Bypass -File .\Run-DCU.ps1
