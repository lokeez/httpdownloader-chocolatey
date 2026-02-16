$ErrorActionPreference = 'Stop'

$startMenu = [Environment]::GetFolderPath("Programs")
$startShortcut = Join-Path $startMenu "HTTP Downloader.lnk"

if (Test-Path $startShortcut) {
    Remove-Item $startShortcut -Force
}

$desktop = [Environment]::GetFolderPath("Desktop")
$desktopShortcut = Join-Path $desktop "HTTP Downloader.lnk"

if (Test-Path $desktopShortcut) {
    Remove-Item $desktopShortcut -Force
}
