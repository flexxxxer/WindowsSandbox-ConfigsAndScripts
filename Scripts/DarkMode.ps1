$ThemeFolder="HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$DesktopFolder="HKCU:\Control Panel\Desktop"

"Dark Mode applying: step 1" | Write-Output 
# hack 1
Set-ItemProperty -Path $ThemeFolder -Name "SystemUsesLightTheme" -Value 0
Set-ItemProperty -Path $ThemeFolder -Name "AppsUseLightTheme" -Value 0

"Dark Mode applying: step 2" | Write-Output
# hack 2
Set-ItemProperty -Path $DesktopFolder -Name "Wallpaper" -Value ""
Set-ItemProperty -Path $DesktopFolder -Name "Wallpaper" -Value "C:\Windows\web\wallpaper\Windows\img19.jpg"

1..5 | ForEach-Object {
    "Dark Mode applying: some hacking things" | Write-Output
    1..5 | ForEach-Object {
        RUNDLL32.EXE USER32.DLL, UpdatePerUserSystemParameters 1, True
    }

    "Dark Mode applying: explorer.exe kill and start" | Write-Output
    taskkill /im explorer.exe /f | Out-Null
    Start-Process explorer.exe | Out-Null
    Start-Sleep -m 500
}

exit