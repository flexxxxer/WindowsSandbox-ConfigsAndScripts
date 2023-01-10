$FolderWithExes = "$PSScriptRoot\..\..\CachedExes\"

$cppRedists = `
    "vc_redist.17.x64.exe", `
    "vc_redist.17.x86.exe", `
    "vc_redist.13.x64.exe", `
    "vc_redist.13.x86.exe", `
    "vc_redist.12.x64.exe", `
    "vc_redist.12.x86.exe", `
    "vc_redist.10.x64.exe", `
    "vc_redist.10.x86.exe", `
    "vc_redist.8.x64.exe", `
    "vc_redist.8.x86.exe"

$cppRedists | ForEach-Object {
    if (-not (Test-Path -Path ($FolderWithExes + $_) -PathType Leaf)) {
        $FolderWithExes = "$PSScriptRoot\..\..\..\Exes\"
        & $PSScriptRoot\..\..\Scripts\DownloadSoftware\CppRedists.Get.ps1 $FolderWithExes | Write-Output
    }

    "Installing CppRedist: " + $_ | Write-Output
    & ($FolderWithExes + $_) /install /quiet /norestart | Out-Null
}

exit