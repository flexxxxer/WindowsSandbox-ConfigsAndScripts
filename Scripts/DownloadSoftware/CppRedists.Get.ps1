param([String] $OutFolder)

if ($OutFolder.Length -eq 0 -or -not (Test-Path -Path $OutFolder)) {
    $OutFolder = "$PSScriptRoot\..\..\CachedExes\"
}

$cppRedistsAndLinks = @{
    # 2015, 2017, 2019, 2022
    "vc_redist.17.x64.exe" = "https://aka.ms/vs/17/release/vc_redist.x64.exe";
    "vc_redist.17.x86.exe" = "https://aka.ms/vs/17/release/vc_redist.x86.exe";
    # 2013
    "vc_redist.13.x64.exe" = "https://aka.ms/highdpimfc2013x64enu";
    "vc_redist.13.x86.exe" = "https://aka.ms/highdpimfc2013x86enu";
    # 2012
    "vc_redist.12.x64.exe" = "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe";
    "vc_redist.12.x86.exe" = "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe";
    # 2010
    "vc_redist.10.x64.exe" = "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe";
    "vc_redist.10.x86.exe" = "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe";
    # 2008
    "vc_redist.8.x64.exe" = "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe";
    "vc_redist.8.x86.exe" = "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe";
}

$ProgressPreference = 'SilentlyContinue'
$cppRedistsAndLinks.GetEnumerator() | ForEach-Object {
    $fileToSave = "$OutFolder" + $_.Key
    $linkToDownload = $_.Value
    
    "Fetching CppRedist: " + $_.Key | Write-Output
    Invoke-RestMethod -Uri $linkToDownload -OutFile $fileToSave
}

exit