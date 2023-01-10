param([String] $OutFolder)

if ($OutFolder.Length -eq 0 -or -not (Test-Path -Path $OutFolder)) {
    $OutFolder = "$PSScriptRoot\..\..\CachedExes\"
}

$linkToDownload = "https://github.com/PowerShell/PowerShell/releases/download/v7.3.1/PowerShell-7.3.1-win-x64.msi"
$fileToSave = "powershell-7.3.1.msi"
$ProgressPreference = 'SilentlyContinue'
"Fetching PowerShell..." | Write-Output
Invoke-RestMethod -Uri $linkToDownload -OutFile ($OutFolder + $fileToSave)