$dst = Join-Path $env:ProgramFiles 'CloudLabs-VPN'
Get-Process CloudLabs-VPN -ErrorAction SilentlyContinue | Stop-Process -Force
Get-Process sing-box -ErrorAction SilentlyContinue | Where-Object { $_.Path -like "$dst*" } | Stop-Process -Force
Start-Sleep 1
schtasks.exe /Delete /TN CloudLabs-VPN /F 2>$null | Out-Null
Remove-Item "$([Environment]::GetFolderPath('Desktop'))\CloudLabs-VPN.lnk", "$([Environment]::GetFolderPath('Programs'))\CloudLabs-VPN.lnk" -ErrorAction SilentlyContinue
Remove-Item $dst -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "CloudLabs-VPN removed from this PC. (Your AWS server is still running - see the README to delete it.)"
