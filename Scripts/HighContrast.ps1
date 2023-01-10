"High Contrast applying..." | Write-Output

# there are hc1.theme, hc2.theme, hcblack.theme and hcwhite.theme
Invoke-Item "C:\Windows\Resources\Ease of Access Themes\hcblack.theme" | Out-Null

Start-Sleep -Seconds 4
taskkill /im SystemSettings.exe /f | Out-Null

exit