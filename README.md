# HTTP Downloader Chocolatey Package (Unofficial)

[![GitHub Repo Stars](https://img.shields.io/github/stars/lokeez/httpdownloader-chocolatey?style=social)](https://github.com/YOUR_USERNAME/httpdownloader-chocolatey)
[![License: Unofficial](https://img.shields.io/badge/license-unofficial-lightgrey)](#disclaimer)
[![Chocolatey](https://img.shields.io/chocolatey/v/chocolatey)](https://chocolatey.org/)


This is an unofficial Chocolatey package for HTTP Downloader.

The software itself is developed by Eric Kutcher:  
https://github.com/erickutcher/httpdownloader

This repository does NOT contain any binaries.  
All files are downloaded directly from the official GitHub releases.

## Requirements

- Windows
- Chocolatey installed  
  https://chocolatey.org/install

## Build the package

From the root directory of this repository:
```powershell
choco pack
```

This will generate a .nupkg file, for example:
```powershell
httpdownloader.1.0.6.9.nupkg
```

## Install locally

Install from the current directory:
```powershell
choco install httpdownloader -s .
```

## If already installed and you rebuilt the package:

```powershell
choco upgrade httpdownloader -s .
```

## Uninstall

```powershell
choco uninstall httpdownloader
```

## Development workflow

Typical update process:

1. Update version in httpdownloader.nuspec
2. Update URLs in chocolateyinstall.ps1
3. Update checksums
4. Run:
```powershell
choco pack
choco upgrade httpdownloader -s .
```

## Disclaimer

- This package is unofficial.
- No binaries are redistributed.
- All downloads are pulled directly from the official GitHub releases.
- Full credit goes to the original author.

## License

This repository (packaging scripts) is licensed under the MIT License.

The HTTP Downloader software itself is developed by Eric Kutcher and is subject to its own license and terms.
