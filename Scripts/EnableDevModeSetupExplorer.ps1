
"Enabling Developer Mode..." | Write-Output
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" `
                 -Name "AllowDevelopmentWithoutDevLicense" -Value 1

"Enabling Showing file extensions..." | Write-Output
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
                 -Name "HideFileExt" -Value 0

"Enabling Showing hidden files..." | Write-Output
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
                 -Name "Hidden" -Value 1