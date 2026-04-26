Import-Module au

$repo = 'erickutcher/httpdownloader'

function global:au_GetLatest {
    $release = Invoke-RestMethod "https://api.github.com/repos/$repo/releases/latest"
    $version = $release.tag_name.TrimStart('v')

    $url32 = $release.assets |
        Where-Object { $_.name -match '^HTTP_Downloader_32\.zip$' } |
        Select-Object -First 1 -ExpandProperty browser_download_url

    $url64 = $release.assets |
        Where-Object { $_.name -match '^HTTP_Downloader_64\.zip$' } |
        Select-Object -First 1 -ExpandProperty browser_download_url

    if (-not $url32 -or -not $url64) {
        throw "Could not find download URLs for version $version"
    }

    Write-Host "Latest version from GitHub: $version"

    return @{
        Version = $version
        URL32   = $url32
        URL64   = $url64
    }
}

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)'.*'"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)'.*'" = "`$1'$($Latest.URL64)'"
        }
    }
}

Update-Package -ChecksumFor all
