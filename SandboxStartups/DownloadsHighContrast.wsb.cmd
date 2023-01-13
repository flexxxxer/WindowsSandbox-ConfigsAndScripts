@echo off

start /wait "" %~dp0\..\Scripts\Exec-Policy-Fix.cmd
start /wait "" powershell.exe -File %~dp0\..\SandboxStartups\DownloadsHighContrast.wsb.ps1

exit