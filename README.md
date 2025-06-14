# Dell Command Update – Enterprise Deployment Script

This PowerShell script is designed for use in enterprise environments to silently run Dell Command | Update (DCU) on endpoints. It’s meant to be pushed through RMM tools like NinjaOne, running as SYSTEM, with no user interaction.

## What it does
- Checks if Dell Command | Update (dcu-cli.exe) is installed
- If it’s missing, the script auto-downloads and installs it silently
- Applies all available updates using:  
  `/applyUpdates /silent /reboot=disable`
- BIOS updates are staged and will apply on next reboot
- Script does **not** trigger a reboot
- No logging or reporting — just clean console output for NinjaOne to capture

## Usage
Run this script through your RMM (like NinjaOne) using a SYSTEM-level script deployment. No interaction required. It’s intended to be run silently in the background across multiple endpoints.

## Notes
- Tested successfully on multiple Mougeot PCs
- Ideal for mass BIOS/driver updates without user disruption
- If DCU is already installed, the script just runs it
- If DCU is missing, it’s downloaded from Dell and installed automatically

## Example NinjaOne Settings
- OS: Windows
- Script Type: PowerShell
- Run As: SYSTEM
- Execution Policy: Bypass

---

This script is built to "just work" in real-world deployments — no fluff, no reboot traps, no extra logging overhead.
