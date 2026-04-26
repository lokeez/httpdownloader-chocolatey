Import-Module au

Set-Location $env:GITHUB_WORKSPACE

$repo = 'erickutcher/httpdownloader'

function global:au_GetLatest {
    $release = Invoke-RestMethod "https://api.github.com/repos/$repo/releases/latest"

    $version = $release.tag_name.TrimStart('v')

    $url32 = $release.assets | Where-Object { $_.name -match '32\.zip$' } | Select-Object -ExpandProperty browser_download_url
    $url64 = $release.assets | Where-Object { $_.name -match '64\.zip$' } | Select-Object -ExpandProperty browser_download_url

    if ($Latest.Version -eq $Package.NuspecVersion) {
        Write-Host "No new version available"
    }
    
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

$global:au_Packages = @{
    "." = @{
        NuspecPath = ".\httpdownloader.nuspec"
    }
}

Update-Package -ChecksumFor all
