# WindowsSandbox-ConfigsAndScripts
**WindowsSandbox-ConfigsAndScripts** is a set of commonly used [Windows Sandbox 
configuration files](https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-configure-using-wsb-file) 
for software development, software testing, and isolated running of untrusted applications.
Because you cannot create Windows Sandbox profiles with preinstalled software and settings 
this repository was made to automate frequently performed actions when starting Windows Sandbox
(mainly pre-installing software and libraries, configuring, changing the appearance - turning on 
a dark theme or high contrast mode).

# Get Started
## Requirements
[Windows Sandbox](https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview)
must be installed (the link also shows installation methods and minimum system requirements).

## Changing mapped folders paths
Most Windows Sandbox configurations use mapped folders. The paths specified in the configurations may not be 
suitable for your computer and will need to be changed. Because paths must be explicitly specified and cannot be 
automatically substituted, let's look at an example.

[Downloads.wsb](https://github.com/flexxxxer/WindowsSandbox-ConfigsAndScripts/blob/master/Downloads.wsb) 
configuration file, which has a mapped folder for the downloads folder:
```xml
<Configuration>
  <VGpu>Enable</VGpu>
  <Networking>Enable</Networking>
  <ProtectedClient>Enable</ProtectedClient>
  <MappedFolders>
    <MappedFolder>
      <HostFolder>C:\Users\%username%\WindowsSandbox-ConfigsAndScripts</HostFolder>
      <SandboxFolder>C:\Users\WDAGUtilityAccount\Desktop\WindowsSandbox-ConfigsAndScripts</SandboxFolder>
      <ReadOnly>true</ReadOnly>
    </MappedFolder>
    <MappedFolder>
      <HostFolder>C:\Users\%username%\Downloads</HostFolder>
      <SandboxFolder>C:\Users\WDAGUtilityAccount\Downloads</SandboxFolder>
      <ReadOnly>true</ReadOnly>
    </MappedFolder>
  </MappedFolders>
  <LogonCommand>
    <Command>C:\Users\WDAGUtilityAccount\Desktop\WindowsSandbox-ConfigsAndScripts\SandboxStartups\Downloads.wsb.cmd</Command>
  </LogonCommand>
</Configuration>
```
In this case, there are two HostFolder tags: 
1. `<HostFolder>C:\Users\%username%\WindowsSandbox-ConfigsAndScripts</HostFolder>`
Specifies the repository folder on the host machine to share into the sandbox. In this case, we specify our 
repository folder with the necessary scripts to run it in the `<Command>` tag. The folder must already exist on the host, 
or the container will fail to start. 
`<SandboxFolder>C:\Users\WDAGUtilityAccount\Desktop\WindowsSandbox-ConfigsAndScripts</SandboxFolder>`
Specifies the destination in the sandbox to map the folder to. If the folder doesn't exist, it will be created.
2. `<HostFolder>C:\Users\%username%\Downloads</HostFolder>` shows an example of sharing a user folder, such as Downloads, 
in a sandbox. If the `<SandboxFolder>` tag is not specified, the folder will be created on the desktop.

`<ReadOnly>true</ReadOnly>`
If true, the shared folder is read-only accessible from the container. The default value is false.

`<Command>C:\Users\WDAGUtilityAccount\Desktop\Scripts\SandboxStartups\Downloads.wsb.cmd</Command>`
Specifies a single command that will be invoked automatically after the sandbox logs on.
Make sure, your repository folder must be shared into to the sandbox, to run the script in the tag above. Otherwise a running *.wsb file 
will cause a crash.

Any <HostFolder> tag has path, which depends on your computer's username and file structure, and it needs to be changed by your requirements.

## Ready-to-use configuration files and their description
[DevEnv.wsb](https://github.com/flexxxxer/WindowsSandbox-ConfigsAndScripts/blob/master/DevEnv.wsb): changes the
appearance of the system by applying a Dark Mode, enabling dev mode in system, showing file extensions and hidden
files and folders in explorer, installing .NET (6, 7, Legacy Framework from 4.6.2 up to 4.8.1), latest PowerShell,
C++ Redistributable packages from 2008 up to latest (2022), Firefox and Visual Studio Code.

[DevEnvHighContrast.wsb](https://github.com/flexxxxer/WindowsSandbox-ConfigsAndScripts/blob/master/DevEnvHighContrast.wsb): 
like previous one, but instead of applying a Dark Mode, this applying a high contrast.

[Downloads.wsb](https://github.com/flexxxxer/WindowsSandbox-ConfigsAndScripts/blob/master/Downloads.wsb): 
enabling dev mode in system, showing file extensions and hidden
files and folders in explorer, opens explorer window at mapped from host downloads folder.

[DownloadsDark.wsb](https://github.com/flexxxxer/WindowsSandbox-ConfigsAndScripts/blob/master/DownloadsDark.wsb): changes the
like previous one, but in a Dark Mode.

[DownloadsHighContrast.wsb](https://github.com/flexxxxer/WindowsSandbox-ConfigsAndScripts/blob/master/DownloadsHighContrast.wsb): changes the
like previous one, but instead of applying a Dark Mode, this applying a high contrast.

## How its working
Each `ConfigurationName.wsb` has a `ConfigurationName.wsb.cmd` and a `ConfigurationName.wsb.ps1`. Using `<LogonCommand>`
`ConfigurationName.wsb` runs the `ConfigurationName.wsb.cmd` script in `Windows Sandbox`. Further, 
`ConfigurationName.wsb.cmd` allows the execution of any PowerShell scripts in the system (by default this is 
disabled for security reasons, but we are in a virtual sandbox), after which it launches `ConfigurationName.wsb.ps1`, 
which launches scripts that execute other scripts that automate routine (installing software and libraries, 
configuring, changing the appearance, etc).

# FAQ
Q: When i launching some `.wsb` configuration, then i have error "The configuration file was invalid" with 
"The system cannot find the path specified".

A: Check all `<HostFolder>` paths for validity and change change if path is invalid.

Q: When i launching some `.wsb` configuration, then i have error "only one running instance of windows sandbox is allowed...".

A: Kill stucked `Windows Sandbox` process in Task Manager. (Hotkey: Ctrl+Shift+ESC)

Q: Downloading and installing software in Windows Sandbox is too long. How can i fix it?

A: Run `UpdateCachedExes.ps1` (which in root of repo) before running Windows Sandbox. This script simply 
downloads the .exe/.msi/etc application installer files to the CachedExes folder, which is located in the folder 
next to UpdateCachedExes.ps1. **It is enough to run this script once, it does not need to be run every time before 
starting Windows Sandbox**.

Q: When i using VPN at host, internet in Windows Sandbox not working. How to fix that?

A: No way to fix that. Need to wait for a fix from microsoft.

# License
WindowsSandbox-ConfigsAndScripts is Copyright © 2023 flexxxxer Aleksandr under the [Apache License, Version 2.0](https://github.com/flexxxxer/WindowsSandbox-ConfigsAndScripts/blob/master/LICENSE.txt).
