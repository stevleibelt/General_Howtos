# PowerShell ReadMe

## General

* PowerShell is a task automation and configuration management framework
* full access to [COM](https://en.wikipedia.org/wiki/Component_Object_Model), [WMI](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation), [WS-Management](https://en.wikipedia.org/wiki/WS-Management) and [CIM](https://en.wikipedia.org/wiki/Common_Information_Model_(computing))
* has build in commands plus Cmdlets (following a Verb-Noun naming pattern)
* use the "Windows PowerShell ISE" to have a more gui friendly autocomplete
* the shebang for powershell is `#!/usr/bin/env pwsh`
* there are four areas where a profile is stored

## Fetch locations of profiles

```pwsh
#@see: https://devblogs.microsoft.com/powershell-community/how-to-make-use-of-powershell-profile-files/
$PROFILE | Get-Member -MemberType NoteProperty
```

## Manage local profile (similar to .bashrc)

### Create local profile

Default path for your profile is `C:\Users\<username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`.

```pwsh
#check if a profile exists
#you don't have a profile if the returned value is `False`
Test-Path $profile

#create new profile
New-Item -Path $profile -type file -force
```

### Example configuration stuff

```pwsh
#set default start location
Set-Location c:

#change title
$Shell.WindowTitle="My Default Window Title"

#change window size and scrollback
$Shell = $Host.UI.RawUI
$size = $Shell.WindowSize
$size.width=70
$size.height=25
$Shell.WindowSize = $size
$size = $Shell.BufferSize
$size.width=70
$size.height=5000
$Shell.BufferSize = $size

#change background and foreground color
$shell.BackgroundColor = “Gray”
$shell.ForegroundColor = “Black”

#create alias
new-item alias:np -value C:WindowsSystem32notepad.exe

#if you want to start with a fresh and clean cli, put this as last entry in your file
Clear-Host
```

## Alias

```pwsh
#list all available alias
get-alias

#write alias to a file
Export-Alias

#load alias from a file
Import-Alias

#create alias
New-Alias #promts an error if alias already exists
Set-Alias #overwrites alias if exists

#example
#create a function and an alias to edit your profile
Function Edit-PowerShellProfile { notepad++ $profile }
New-Alias editPowerShellProfile Edit-PowerShellProfile
```

## Usefull commands

| Power Shell Command | Power Shell Alias | Unix Command | Comment |
| --- | --- | --- | --- |
| Clear-Host | clear | clear | |
| Copy-Item | cp | cp | |
| Get-Children | ls | ls | |
| Get-Content | cat | cat | |
| Get-Command | gcm | type, which | |
| Get-Service | | systemctl list-units | |
| Get-Date | | |
| Get-Help | help, man | apropos, man | |
| Get-Location | pwd | pwd | |
| Get-Process | ps | ps | |
| Invoke-WebRequest | iwr | wget, curl | |
| Measure-Performance | | | Measure-Performance {#your command call here} |
| Move-Item | mv | mv | |
| Pop-Location | popd | popd | |
| Push-Location | pushd | pushd | |
| Remove-Item | rm | rm, rmdir | |
| Rename-Item | mv | mv | |
| Restart-Service | | | Restart-Service -InputObject $(Get-Service -Computer <computer name> -Name <service name>) |
| Select-String | sls | find, grep | `Select-String -Pattern "my_string" -Path .` |
| Set-Location | cd | cd | |
| Set-Variable | set | export, env, set, setenv | |
| Start-Service | | | Start-Service -InputObject $(Get-Service -Computer <computer name> -Name <service name>) |
| Stop-Service | | | Stop-Service -InputObject $(Get-Service -Computer <computer name> -Name <service name>) |
| Stop-Process | kill | kill | |
| Tee-Object | tee | tee | |
| Test-Connection | ping | ping | |
| Write-Host | | | use it if you want to output directly to the console |
| Write-Output | echo | echo | use it if you want to pipe it |

### Set execution policy

```pwsh
#Allow all
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

#Set back to default
Set-ExecutionPolicy -ExecutionPolicy Default
```

## Useful variables

```pwsh
#Plattform independent directory seperator

$myLogPath = ($PSScriptRoot + [IO.Path]::DirectorySeparatorChar + "log")

#Path of the current *.ps1 file
#   if directory structure is as following
#       <project root>/
#           bin/this_script.ps1
#           configuration/first_configuration_file.cfg
$relativeProjectRootPath = $($PSScriptRoot + "\..")

#@see: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/resolve-path?view=powershell-7
$absolutProjectRootPath = Resolve-Path -Path $relativeProjectRootPath
$myRelativePathToTheConfigurationFile = $($myRelativePathToTheConfigurationFile + "\configuration\first_configuration_file.cfg")
Write-Host $PSScriptRoot
```

## Function

### Run a script file

```pwsh
#assuming you want to start the my_script from a bat script in the same path
#@see:
#   https://stackoverflow.com/questions/5034076/what-does-dp0-mean-and-how-does-it-work
powershell -ExecutionPolicy Bypass -File "%~dp0my_script.ps1"
```

### Execute a ps1 script from inside a ps1 script

```pwsh
#both versions are working
Invoke-Expression -Command "\\path\to\the\script.ps1"
#this too
"\\path\to\the\script.ps1" | Invoke-Expression
#or
$script = ".\my_script_in_the_same_path.ps1"
.$script
```

## link

### Basic example

```pwsh
#Want to know how to write a function in Powershell?
Get-Help About_Functions

#function definition
function my_function ($ParameterOne, $ParameterTwo)
{
    //body
}

#there are two ways to call it
my_function valueOne valueTwo
my_function -ParameterOne valueOne -ParameterTwo valueTwo
```

## Modules

* Only the administrator can install a module
* Online repository is available at [powershellgallery.com](https://www.powershellgallery.com/)

### How to install

```pwsh
#list installed modules
Get-Module
#list available modules including commandlets
Get-Module -ListAvailable
#list installed
Get-Module -All
#list modules having update in their name
Get-Module -Name "*update*"

#use online repository
Install-Module -Name PSScriptAnalyzer

#use local file
Import-Module path\to\the\PSScriptAnalyzer.psd1

#list functions per module
Get-Command -Module PSScriptAnalyzer
#list synopsis/help for a module function name
Get-Help -Name Start-WUScan
```

### Useful modules

* [PSScriptAnalyzer](https://www.powershellgallery.com/packages/PSScriptAnalyzer/)
* [PSWindowsUpdate](https://www.powershellgallery.com/packages/PSWindowsUpdate/)
* [PSLogging](https://www.powershellgallery.com/packages/PSLogging/)
* [Pester (BDD Test framework)](https://www.powershellgallery.com/packages/Pester/)
* [VMware.Vim](https://www.powershellgallery.com/packages/VMware.Vim/)

## Usage Examples

### Output


```pwsh
#dump function body of Start-WUScan
Get-Content Function:\Start-WUScan

#if you experience the "..." (three dots) when dumping an object (e.g. Get-Acl)
#  pipe the output through SELECT and expand the property you want to display
<your command> | SELECT -expandproperty <property name>
```

### Variable type detection

```pwsh
#prints "System.String" etc.
<variable>.GetType().FullName
```

### Strings

```pwsh
"My String".toupper()
"My String".tolower()
```

### Arrays

```pwsh
#create
$array = New-Object System.Collections.ArrayList

#add one
$array.add("foo")

#remove one by name
$array.remove("foo")
#remove by index number and amount
$array.removerange(1,1)
```

### Environment

```pwsh
#List all environment variables
# @see: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables
# Same as "Set-Location Env:" and "Get-ChildItem" or "Get-ChildItem Env:"
Get-Item -Path Env:*
```

### Filesystem

```pwsh
#check if path is a root path or not
#does not check if path exists!
[System.IO.Path]::IsPathRooted($path)
```

```pwsh
#create temporary file name
$temporaryFilePath = [System.IO.Path]::GetTempFileName()

#create time
(Get-Item c:file.foo).creationtime
#modification time
(Get-Item c:file.foo).lastwritetime
#size
"{0:N2}" -f ((Get-Item c:file.foo).length/1mb) + " MB"
#extension
(Get-Item c:file.foo) | SELECT extension
#basedir
c:file.foo | SELECT directory
#security permissions
(Get-Item c:file.foo).getaccesscontrol.invoke() | SELECT owner -ExpandProperty access

#cat foo >> bar
Add-Content "bar" (Get-Content "foo")

#list empty files
Get-Childitem -Recurse | foreach-object {
    if(!$_.PSIsContainer -and $_.Length -eq 0) { #!$_.PSIsContainer = is not a directory
        Write-Host ("File {0} has a size of {1}" -f $_.FullName, $_.Length)
    }
}
```

### Network

```pwsh
#get ip by name
[System.Net.DNS]::GetHostAddresses("bazzline.net")

#get name by ip
[System.Net.DNS]::GetHostByAddress("127.0.0.1")

#get neighbor ip addresses
Get-NetNeighbor -AddressFamily IPv4 | WHERE {$_.state -eq "stale" -or $_.state -eq "reachable"}

#login to remote pc
Enter-PSSession -ComputerName <hostname|ip address> -Credentials <username>
#run command on remote pc
#@see: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/invoke-command?view=powershell-7
Invoke-Command -Computer <hostname|ip address> -ScriptBlock {Get-Service}
#restart remote pc
Restart-Computer -ComputerName <hostname|ip address> [-Force]
#power off remote pc
Stop-Computer -ComputerName <hostname|ip address> [-Force]
#Ping remote pc
Test-Connection -ComputerName <hostname|ip address> -Source <host name|ip address>
#rename a pc
Rename-Computer -ComputerName <hostname|ip address> -LocalCredential Domain\User -Restart
#add a pc to the domain
Add-Computer -ComputerName <hostname[,hostname[,...]]> -DomainName <domain name> -Credential Domain\User -Restart
#get services on remote pc
Get-Service -ComputerName <hostname> [-Name <servicename>] [-Status <Running|Stopped>]
#filter by name
Get-Service -ComputerName <hostname> | Where-Object {$_.name -Like 'Win*'}
#modifie a service
Set-Service -ComputerName <hostname> -Name <servicename> -Status <Running|Stopped>
#start a task
Start-Job -FilePath <path to the powershell script>
```

### Active Directory

```pwsh
#get ad user
Get-ADUser -Identity <samUserName> -Properties *

#move ad object to a different OU
Move-ADObject -Identity "CN=DC01,OU=TestServers,OU=Administration,DC=bazzline,DC=net" -TargetPath "OU=ProductionServers,OU=Administration,DC=bazzline,DC=net"

#set ad user property
Set-ADUser -Identity <samUserName> -EmailAddress "john_doe@company.com"

#list all users with the name containing 'zub'
Get-AdUser -Filter {(Name -like "*zub*")} | Select -Property Name,GivenName,SamAccountName,Surname,Enabled | Format-Table
#list all users with the name containing 'zub' or 'buz'
Get-AdUser -Filter {(Name -like "*zub*") -o (Name -lile "*buz*")} | Select -Property Name,GivenName,SamAccountName,Surname,Enabled | Format-Table

#list all pc names starting with 'nb-'
Get-ADComputer -Filter {(Name -like "nb-*")} | Select -Property Name,DNSHostName,Enabled,LastLogonDate | Format-Table

#get last login/logon timestamp
Get-ADUser $username | Get-ADObject -Properties lastLogon
```

### Users

```pwsh
#get ad user
Get-ADUser -Identity <samUserName> -Properties *

#move ad object to a different OU
Move-ADObject -Identity "CN=DC01,OU=TestServers,OU=Administration,DC=bazzline,DC=net" -TargetPath "OU=ProductionServers,OU=Administration,DC=bazzline,DC=net"

#set ad user property
Set-ADUser -Identity <samUserName> -EmailAddress "john_doe@company.com"

#list all users with the name containing 'zub'
Get-AdUser -Filter {(Name -like "*zub*")} | Select -Property Name,GivenName,SamAccountName,Surname,Enabled | Format-Table
#list all users with the name containing 'zub' or 'buz'
Get-AdUser -Filter {(Name -like "*zub*") -o (Name -lile "*buz*")} | Select -Property Name,GivenName,SamAccountName,Surname,Enabled | Format-Table

#list all pc names starting with 'nb-'
Get-ADComputer -Filter {(Name -like "nb-*")} | Select -Property Name,DNSHostName,Enabled,LastLogonDate | Format-Table

#get last login/logon timestamp
Get-ADUser $username | Get-ADObject -Properties lastLogon
#get users on a (terminal) server
Query User /server:terminalserver01
```

## Write verbose script


```pwsh
#store existing value to reset it at the end of your script
$oldVerbosePreference = $VerbosePreference
#Enables verbose
$VerbosePreference = "continue"

#bind all built in flags etc in your function

Function My-Function
{
    [cmdletbinding()]
    Param()

    Write-Verbose "Test Verbose"
}

#...
#restore old value at the end of your script
$VerbosePreference = $oldVerbosePreference
```

## Links

* [ActiveDirectory Module: microsoft.com](https://docs.microsoft.com/en-us/powershell/module/addsadministration/?view=win10-ps) - 20200129
* [Analyze DHCP server with Powershell: 4sysops.com](https://4sysops.com/archives/analyze-dhcp-server-with-powershell/) - 20200811
* [Customizing your PowerShell Profile: howtogeek.com](https://www.howtogeek.com/50236/customizing-your-powershell-profile/) - 20200120
* [How to create PowerShell alias: 4sysops.com](https://4sysops.com/archives/how-to-create-a-powershell-alias/) - 20140729
* [Powershellbrows.com](https://www.powershellbros.com/) - 20200129
* [PowerShell: wikipedia.org](https://en.wikipedia.org/wiki/PowerShell) - 20200127
* [PowerShell Examples: technibee.com](https://techibee.com/category/powershell) - 20200129
* [PowerShell Tip of the Week: Move computer objects to OU: powershellbros.com](https://www.powershellbros.com/powershell-move-computer-objects-to-ou/) - 20200205
* [Scripting blog: microsoft.com](https://devblogs.microsoft.com/scripting/feed/) - 20200129
* [Sign powershell script: microsoft.com](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_signing?view=powershell-7.3) - 20230524
* [Use PowerShell to Write Verbose Output: microsoft.com](https://devblogs.microsoft.com/scripting/use-powershell-to-write-verbose-output/) - 20200730


