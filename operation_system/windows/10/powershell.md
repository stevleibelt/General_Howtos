# General

* PowerShell is a task automation and configuration management framework
* full access to [COM](https://en.wikipedia.org/wiki/Component_Object_Model), [WMI](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation), [WS-Management](https://en.wikipedia.org/wiki/WS-Management) and [CIM](https://en.wikipedia.org/wiki/Common_Information_Model_(computing))
* has build in commands plus Cmdlets (following a Verb-Noun naming pattern)
* use the "Windows PowerShell ISE" to have a more gui friendly autocomplete

# Usefull commands

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
| Select-String | sls | find, grep | |
| Set-Location | cd | cd | |
| Set-Variable | set | export, env, set, setenv | |
| Start-Service | | | Start-Service -InputObject $(Get-Service -Computer <computer name> -Name <service name>) |
| Stop-Service | | | Stop-Service -InputObject $(Get-Service -Computer <computer name> -Name <service name>) |
| Stop-Process | kill | kill | |
| Tee-Object | tee | tee | |
| Test-Connection | ping | ping | |
| Write-Host | | | use it if you want to output directly to the console |
| Write-Output | echo | echo | use it if you want to pipe it |

## Set execution policy

```
#Allow all
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

#Set back to default
Set-ExecutionPolicy -ExecutionPolicy Default
```

# Function

## Basic example

```
#function definition
function my_function ($ParameterOne, $ParameterTwo)
{
    //body
}

#there are two ways to call it
my_function valueOne valueTwo
my_function -ParameterOne valueOne -ParameterTwo valueTwo
```

# Modules

* Only the administrator can install a module
* Online repository is available at [powershellgallery.com](https://www.powershellgallery.com/)

## How to install

```
#use online repository
Install-Module -Name PSScriptAnalyzer

#use local file
Import-Module path\to\the\PSScriptAnalyzer.psd1

#list functions per module
Get-Command -Module PSScriptAnalyzer
```

## Useful modules

* [PSScriptAnalyzer](https://www.powershellgallery.com/packages/PSScriptAnalyzer/)
* [PSWindowsUpdate](https://www.powershellgallery.com/packages/PSWindowsUpdate/)
* [PSLogging](https://www.powershellgallery.com/packages/PSLogging/)
* [Pester (BDD Test framework)](https://www.powershellgallery.com/packages/Pester/)
* [VMware.Vim](https://www.powershellgallery.com/packages/VMware.Vim/)

# Usage Examples

## Output


```
#if you experience the "..." (three dots) when dumping an object (e.g. Get-Acl)
#  pipe the output through SELECT and expand the property you want to display
<your command> | SELECT -expandproperty <property name>
```

## Variable type detection

```
#prints "System.String" etc.
<variable>.GetType().FullName
```

## Strings

```
"My String".toupper()
"My String".tolower()
```

## Arrays

```
#create
$array = New-Object System.Collections.ArrayList

#add one
$array.add("foo")

#remove one by name
$array.remove("foo")
#remove by index number and amount
$array.removerange(1,1)
```

## Filesystem

```
#check if path is a root path or not
#does not check if path exists!
[System.IO.Path]::IsPathRooted($path)
```

```
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
add-content "bar" (Get-Content "foo")

#list empty files
Get-Childitem -Recurse | foreach-object {
    if(!$_.PSIsContainer -and $_.Length -eq 0) { #!$_.PSIsContainer = is not a directory
        Write-Host ("File {0} has a size of {1}" -f $_.FullName, $_.Length)
    }
}
```

## Network

```
#get ip by name
[System.Net.DNS]::GetHostAddresses("bazzline.net")

#get name by ip
[System.Net.DNS]::GetHostByAddress("127.0.0.1")
```

# Links

* [PowerShell - wikipedia.org](https://en.wikipedia.org/wiki/PowerShell) - 2020-01-27
* [PowerShll Examples - technibee.com](https://techibee.com/category/powershell) - 2020-01-29
* [Scripting blog - microsoft.com](https://devblogs.microsoft.com/scripting/feed/) - 2020-01-29
* [Powershellbrows.com](https://www.powershellbros.com/) - 2020-01-29
* [ActiveDirectory Module - microsoft.com](https://docs.microsoft.com/en-us/powershell/module/addsadministration/?view=win10-ps) - 2020-01-29
