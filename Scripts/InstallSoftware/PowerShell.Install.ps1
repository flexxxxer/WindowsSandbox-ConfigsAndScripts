$FolderWithExes = (Get-Item $PSScriptRoot).Parent.Parent.FullName + "\CachedExes\"
$fileToExecute = "powershell-7.3.2.msi"

if (-not (Test-Path -Path ($FolderWithExes + $fileToExecute) -PathType Leaf)) {
    $FolderWithExes = (Get-Item $PSScriptRoot).Parent.Parent.Parent.FullName + "\Exes\"
    & $PSScriptRoot\..\..\Scripts\DownloadSoftware\PowerShell.Get.ps1 $FolderWithExes | Write-Output
}

"Installing PowerShell: $fileToExecute" | Write-Output
msiexec /i ($FolderWithExes + $fileToExecute) /quiet /qn /norestart | Out-Null
