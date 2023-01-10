$FolderWithExes = (Get-Item $PSScriptRoot).Parent.Parent.FullName + "\CachedExes\"
$fileToExecute = "firefox.exe"

if (-not (Test-Path -Path ($FolderWithExes + $fileToExecute) -PathType Leaf)) {
    $FolderWithExes = (Get-Item $PSScriptRoot).Parent.Parent.Parent.FullName + "\Exes\"
    & $PSScriptRoot\..\..\Scripts\DownloadSoftware\Firefox.Get.ps1 $FolderWithExes | Write-Output
}

"Installing Firefox: $fileToExecute" | Write-Output
& ($FolderWithExes + $fileToExecute) | Out-Null
Start-Sleep -Seconds 4
taskkill /im firefox.exe /f | Out-Null