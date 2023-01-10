param([String] $OutFolder)

if ($OutFolder.Length -eq 0 -or -not (Test-Path -Path $OutFolder)) {
    $OutFolder = "$PSScriptRoot\..\..\CachedExes\"
}

$linkToDownload = "https://download.mozilla.org/?product=firefox-stub&os=win&lang=en-US"
$fileToSave = "firefox.exe"
$ProgressPreference = 'SilentlyContinue'

"Fetching Firefox..." | Write-Output
Invoke-RestMethod -Uri $linkToDownload -OutFile ($OutFolder + $fileToSave)