& $PSScriptRoot\..\Scripts\HighContrast.ps1 | Write-Output
& $PSScriptRoot\..\Scripts\EnableDevModeSetupExplorer.ps1 | Write-Output

Start-Process explorer.exe C:\users\WDAGUtilityAccount\Downloads | Out-Null