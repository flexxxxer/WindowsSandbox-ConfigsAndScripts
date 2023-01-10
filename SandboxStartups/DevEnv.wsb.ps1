"Making new directory: C:\users\WDAGUtilityAccount\Desktop\Exes\" | Write-Output
New-Item -Path "C:\users\WDAGUtilityAccount\Desktop\" `
         -Name "Exes" `
         -ItemType "directory" -Force | Out-Null

# one of two: drak mode, or high contrast
& $PSScriptRoot\..\Scripts\DarkMode.ps1 | Write-Output
# & $PSScriptRoot\..\Scripts\HighContrast.ps1 | Write-Output

& $PSScriptRoot\..\Scripts\EnableDevModeSetupExplorer.ps1 | Write-Output
& $PSScriptRoot\..\Scripts\InstallSoftware\PowerShell.Install.ps1 | Write-Output
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" `
            + [System.Environment]::GetEnvironmentVariable("Path","User")
& pwsh.exe -File $PSScriptRoot\..\Scripts\InstallSoftware\CppRedists.Install.ps1 | Write-Output
& pwsh.exe -File $PSScriptRoot\..\Scripts\InstallSoftware\DotNetSdk.Install.ps1 -GetLegacyFramework:True | Write-Output
& pwsh.exe -File $PSScriptRoot\..\Scripts\InstallSoftware\Firefox.Install.ps1 True | Write-Output
& pwsh.exe -File $PSScriptRoot\..\Scripts\InstallSoftware\VSCode.Install.ps1 True | Write-Output

"Done." | Write-Output
Start-Sleep -Seconds 5