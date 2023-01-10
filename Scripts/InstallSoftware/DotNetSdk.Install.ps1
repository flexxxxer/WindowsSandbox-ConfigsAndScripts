param([Boolean] $GetLegacyFramework = $false)

$FolderWithExes = "$PSScriptRoot\..\..\CachedExes\"

$dotnetSdkAndLinks = `
    "dotnet-sdk-7.0.exe", `
    "dotnet-sdk-6.0.exe"

$legacyFrameworkSdkAndLinks = `
    "net481-developer-pack.exe", `
    "net48-developer-pack.exe", `
    "net472-developer-pack.exe", `
    "net471-developer-pack.exe", `
    "net47-developer-pack.exe", `
    "net462-developer-pack.exe"

if ($GetLegacyFramework){
    $dotnetSdkAndLinks += $legacyFrameworkSdkAndLinks
}

$dotnetSdkAndLinks | ForEach-Object {
    if (-not (Test-Path -Path ($FolderWithExes + $_) -PathType Leaf)) {
        $FolderWithExes = "$PSScriptRoot\..\..\..\Exes\"
        & $PSScriptRoot\..\..\Scripts\DownloadSoftware\DotNetSdk.Get.ps1 $FolderWithExes $GetLegacyFramework | Write-Output
    }

    "Installing .NET SDK: " + $_ | Write-Output
    & ($FolderWithExes + $_) /install /quiet /norestart | Out-Null
}

exit