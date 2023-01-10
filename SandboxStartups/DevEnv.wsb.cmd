@echo off

start /wait "" %~dp0\..\Scripts\Exec-Policy-Fix.cmd
start /wait "" powershell.exe -File %~dp0\..\SandboxStartups\DevEnv.wsb.ps1

exit