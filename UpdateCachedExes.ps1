New-Item -ItemType Directory -Force -Path $PSScriptRoot\CachedExes\ | Out-Null

Get-ChildItem -Path $PSScriptRoot\CachedExes\ -Include *.* -File -Recurse | ForEach-Object { $_.Delete()}

& pwsh.exe -File $PSScriptRoot\Scripts\DownloadSoftware\CppRedists.Get.ps1 | Write-Output
& pwsh.exe -File $PSScriptRoot\Scripts\DownloadSoftware\PowerShell.Get.ps1 | Write-Output
& pwsh.exe -File $PSScriptRoot\Scripts\DownloadSoftware\DotNetSdk.Get.ps1 -GetLegacyFramework:True | Write-Output
& pwsh.exe -File $PSScriptRoot\Scripts\DownloadSoftware\Firefox.Get.ps1 | Write-Output
& pwsh.exe -File $PSScriptRoot\Scripts\DownloadSoftware\VSCode.Get.ps1 | Write-Output

"Done." | Write-Output
Start-Sleep -Seconds 5