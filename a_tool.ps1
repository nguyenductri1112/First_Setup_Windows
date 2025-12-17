# install scoop
<#
start powershell -wait -argumentlist @"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
exit
"@
#>
#install app 

start powershell -verb runas -wait -argumentList @" 
winget install UniKey.UniKey
winget install Fastfetch-cli.Fastfetch
<#
winget install Microsoft.DotNet.Runtime.10
winget install Microsoft.DotNet.AspNetCore.10
winget install Microsoft.DotNet.DesktopRuntime.10
#>
winget install Microsoft.DotNet.SDK.10
<#
winget install Microsoft.VCRedist.2005.x64
winget install Microsoft.VCRedist.2008.x64
winget install Microsoft.VCRedist.2010.x64
winget install Microsoft.VCRedist.2012.x64
winget install Microsoft.VCRedist.2013.x64
#>
winget install Microsoft.VCRedist.2015+.x64
<#
winget install Microsoft.VCRedist.2005.x86
winget install Microsoft.VCRedist.2008.x86
winget install Microsoft.VCRedist.2010.x86
winget install Microsoft.VCRedist.2012.x86
winget install Microsoft.VCRedist.2013.x86
#>
winget install Microsoft.VCRedist.2015+.x86
"@
start powershell -wait -argumentlist @"
scoop install git
scoop bucket add extras
scoop bucket add main
scoop bucket add versions
scoop install extras/revouninstaller
scoop install extras/freedownloadmanager
scoop install main/fzf
"@

 
function create{
    param(
        [string]$text1, #Path Folder
	    [string]$text2, #Link Download
        [string]$text3  #File Name
    )
    mkdir $text1
    iwr $text2 -outfile "$text1\$text3"
}

create -text1 "C:\Elephant" -text2 "https://free-addons.org/FDM/elephant.fda" -text3 "elephant.fda"
create -text1 "C:\Office" -text2 "https://github.com/nguyenductri1112/storage/releases/download/config/Configuration.xml" -text3 "config.xml"
iwr "https://github.com/nguyenductri1112/storage/releases/download/config/setup.exe" -outfile "C:\Office\setup.exe"
$configPath = "C:\Office\config.xml"
$configRun = "C:\Office\setup.exe"
Start "$configRun" -ArgumentList "/configure $configPath" -verb runas -Wait






