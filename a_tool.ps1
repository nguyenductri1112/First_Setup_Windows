

# install scoop

start powershell -wait -argumentlist @"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
exit
"@

#install chocolatey

start powershell -verb runas -wait -argumentlist @"
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
exit
"@

#install app 

start powershell -wait -argumentList @" 
winget install UniKey.UniKey
winget install Fastfetch-cli.Fastfetch


winget install Microsoft.DotNet.Runtime.10
winget install Microsoft.DotNet.AspNetCore.10
winget install Microsoft.DotNet.DesktopRuntime.10
winget install Microsoft.DotNet.SDK.10

winget install Microsoft.VCRedist.2005.x64
winget install Microsoft.VCRedist.2008.x64
winget install Microsoft.VCRedist.2010.x64
winget install Microsoft.VCRedist.2012.x64
winget install Microsoft.VCRedist.2013.x64
winget install Microsoft.VCRedist.2015+.x64

winget install Microsoft.VCRedist.2005.x86
winget install Microsoft.VCRedist.2008.x86
winget install Microsoft.VCRedist.2010.x86
winget install Microsoft.VCRedist.2012.x86
winget install Microsoft.VCRedist.2013.x86
winget install Microsoft.VCRedist.2015+.x86

scoop install git
scoop install extras
scoop install extras/telegram

"@

start powershell -verb runas -wait -argumentlist @"
choco install floorp -y
choco install fzf -y
choco install revo-uninstaller -y
choco install zalopc -y
choco install freedownloadmanager -y
"@


function create{
    param(
        [string]$text1, #Path Folder
	[string]$text2, #Link Download
        [string]$text3  #File Name
    )
    mkdir $text1
    iwr $text2 -outfile "$text1/$text3"
}

create -text1 "C:\Elephant" -text2 "https://free-addons.org/FDM/elephant.fda" -text3 "elephant.fda"

create -text1 "C:\Office" -text2 "https://free-addons.org/FDM/elephant.fda" -text3 "config.xml"
iwr "" -outfile "C:\Office\setup.exe"
$configPath = "C:\Office\config.xml"
$configRun = "C:\Office\setup.exe"
Start "$configRun" -ArgumentList "/configure $configPath" -verb runas -Wait

