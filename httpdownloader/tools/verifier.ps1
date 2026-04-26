$toolsDir = Join-Path $env:ChocolateyInstall "lib\httpdownloader\tools"

$exe = Get-ChildItem $toolsDir -Recurse -Filter "HTTP_Downloader.exe" | Select-Object -First 1

if (-not $exe) {
    throw "Executable not found in package"
}

Write-Host "Found executable at: $($exe.FullName)"
