$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/erickutcher/httpdownloader/releases/download/v1.0.6.9/HTTP_Downloader_32.zip'
$url64      = 'https://github.com/erickutcher/httpdownloader/releases/download/v1.0.6.9/HTTP_Downloader_64.zip'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $url
  url64bit       = $url64
  checksum       = '17ce6c330068e05f521445784d560eb3f086e276613f2da996281cc88357363e'
  checksumType   = 'sha256'
  checksum64     = 'a80e8a712d01f150e995c750ed1fcafe7e6e9c06f2866f2e338df2c0cc6be616'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$exePath = Get-ChildItem $toolsDir -Recurse -Filter "HTTP_Downloader.exe" |
           Select-Object -First 1 -ExpandProperty FullName

if (-not $exePath) {
    throw "HTTP_Downloader.exe not found after extraction."
}

$startMenu = [Environment]::GetFolderPath("Programs")
$shortcutPath = Join-Path $startMenu "HTTP Downloader.lnk"

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcutPath `
  -TargetPath $exePath `
  -WorkingDirectory (Split-Path $exePath) `
  -Description "HTTP Downloader"

$desktop = [Environment]::GetFolderPath("Desktop")
$desktopShortcut = Join-Path $desktop "HTTP Downloader.lnk"

Install-ChocolateyShortcut `
  -ShortcutFilePath $desktopShortcut `
  -TargetPath $exePath `
  -WorkingDirectory (Split-Path $exePath) `
  -Description "HTTP Downloader"
