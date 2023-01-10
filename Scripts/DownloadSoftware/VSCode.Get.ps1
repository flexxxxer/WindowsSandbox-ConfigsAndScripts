param([String] $OutFolder)

if ($OutFolder.Length -eq 0 -or -not (Test-Path -Path $OutFolder)) {
    $OutFolder = "$PSScriptRoot\..\..\CachedExes\"
}

$linkToDownload = "https://update.code.visualstudio.com/latest/win32-x64-user/stable"
$fileToSave = "vscode.exe"
$ProgressPreference = 'SilentlyContinue'

"Fetching Visual Studio Code..." | Write-Output
Invoke-RestMethod -Uri $linkToDownload -OutFile ($OutFolder + $fileToSave)