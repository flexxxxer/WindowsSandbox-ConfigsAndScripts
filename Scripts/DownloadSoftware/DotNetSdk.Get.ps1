param([String] $OutFolder, [Boolean] $GetLegacyFramework = $false)

if ($OutFolder.Length -eq 0 -or -not (Test-Path -Path $OutFolder)) {
    $OutFolder = "$PSScriptRoot\..\..\CachedExes\"
}

$dotnetSdkAndLinks = @{
    "dotnet-sdk-7.0.exe" = "https://download.visualstudio.microsoft.com/download/pr/35660869-0942-4c5d-8692-6e0d4040137a/4921a36b578d8358dac4c27598519832/dotnet-sdk-7.0.101-win-x64.exe";
    "dotnet-sdk-6.0.exe" = "https://download.visualstudio.microsoft.com/download/pr/0a672516-37fb-40de-8bef-725975e0b137/a632cde8d629f9ba9c12196f7e7660db/dotnet-sdk-6.0.404-win-x64.exe";
}

$legacyFrameworkSdkAndLinks = @{
    "net481-developer-pack.exe" = "https://go.microsoft.com/fwlink/?linkid=2203306";
    "net48-developer-pack.exe" = "https://go.microsoft.com/fwlink/?linkid=2088517";
    "net472-developer-pack.exe" = "https://go.microsoft.com/fwlink/?linkid=874338";
    "net471-developer-pack.exe" = "https://go.microsoft.com/fwlink/?linkid=2099382";
    "net47-developer-pack.exe" = "https://go.microsoft.com/fwlink/?linkid=2099465";
    "net462-developer-pack.exe" = "https://go.microsoft.com/fwlink/?linkid=2099466";
}

if ($GetLegacyFramework) {
    $dotnetSdkAndLinks += $legacyFrameworkSdkAndLinks
}

$ProgressPreference = 'SilentlyContinue'
$dotnetSdkAndLinks.GetEnumerator() | ForEach-Object {
    $fileToSave = "$OutFolder" + $_.Key
    $linkToDownload = $_.Value
    "Fetching .NET SDK: " + $_.Key | Write-Output
    Invoke-RestMethod -Uri $linkToDownload -OutFile $fileToSave
}

exit