$FolderWithExes = (Get-Item $PSScriptRoot).Parent.Parent.FullName + "\CachedExes\"
$fileToExecute = "vscode.exe"

if (-not (Test-Path -Path ($FolderWithExes + $fileToExecute) -PathType Leaf)) {
    $FolderWithExes = (Get-Item $PSScriptRoot).Parent.Parent.Parent.FullName + "\Exes\"
    & $PSScriptRoot\..\..\Scripts\DownloadSoftware\VSCode.Get.ps1 $FolderWithExes | Write-Output
}

"Installing Visual Studio Code: $fileToExecute" | Write-Output
& $FolderWithExes$fileToExecute /verysilent /suppressmsgboxes | Out-Null
