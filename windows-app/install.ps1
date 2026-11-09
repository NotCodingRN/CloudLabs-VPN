$ErrorActionPreference = 'Stop'
$src = Join-Path $PSScriptRoot 'app'
$dst = Join-Path $env:ProgramFiles 'CloudLabs-VPN'

Write-Host "`n=== Installing CloudLabs-VPN ===`n"

# stop a running copy
Get-Process CloudLabs-VPN -ErrorAction SilentlyContinue | Stop-Process -Force
Get-Process sing-box -ErrorAction SilentlyContinue | Where-Object { $_.Path -like "$dst*" } | Stop-Process -Force
Start-Sleep 1

New-Item -ItemType Directory -Force $dst | Out-Null
# config.json from the old single-user version: the app now gets its settings after you sign in
Remove-Item "$dst\config.json" -ErrorAction SilentlyContinue
Copy-Item "$src\*" $dst -Force
Write-Host "Installed to $dst"

# shortcuts
$sh = New-Object -ComObject WScript.Shell
foreach ($lnk in @("$([Environment]::GetFolderPath('Desktop'))\CloudLabs-VPN.lnk", "$([Environment]::GetFolderPath('Programs'))\CloudLabs-VPN.lnk")) {
  $s = $sh.CreateShortcut($lnk); $s.TargetPath = "$dst\CloudLabs-VPN.exe"; $s.WorkingDirectory = $dst; $s.Description = 'CloudLabs-VPN'; $s.Save()
}
Write-Host "Shortcuts added to Desktop and Start menu"

# older versions started at sign-in; remove that task if it's there
cmd /c "schtasks /Delete /TN CloudLabs-VPN /F >nul 2>&1"

# launch
Start-Process "$dst\CloudLabs-VPN.exe"
Write-Host "`nCloudLabs-VPN is open. Sign in with the username and password you were given."
Write-Host "The shield icon in the system tray shows the status: green = connected.`n"
