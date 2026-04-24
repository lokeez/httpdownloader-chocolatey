$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$exePath = Get-ChildItem $toolsDir -Recurse -Filter "HTTP_Downloader.exe" |
           Select-Object -First 1 -ExpandProperty FullName

if (-not $exePath) {
    throw "Executable not found"
}

Write-Host "Found executable at $exePath"

# Спроба запустити
$process = Start-Process -FilePath $exePath -PassThru

Start-Sleep -Seconds 5

if (!$process.HasExited) {
    Write-Host "App started successfully"
    Stop-Process -Id $process.Id -Force
} else {
    throw "Application exited immediately"
}
