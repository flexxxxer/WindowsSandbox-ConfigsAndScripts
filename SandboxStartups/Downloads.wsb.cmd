@echo off

start /wait "" %~dp0\..\Scripts\Exec-Policy-Fix.cmd
start /wait "" powershell.exe -File %~dp0\..\SandboxStartups\Downloads.wsb.ps1

explorer.exe C:\users\WDAGUtilityAccount\Downloads

exit