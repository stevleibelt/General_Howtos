# General

* PowerShell is a task automation and configuration management framework
* full access to [COM](https://en.wikipedia.org/wiki/Component_Object_Model), [WMI](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation), [WS-Management](https://en.wikipedia.org/wiki/WS-Management) and [CIM](https://en.wikipedia.org/wiki/Common_Information_Model_(computing))
* has build in commands plus Cmdlets (following a Verb-Noun naming pattern)
* use the "Windows PowerShell ISE" to have a more gui friendly autocomplete

# Usefull commands

| Power Shell Command | Power Shell Alias | Unix Command | Comment |
| --- | --- | --- | --- |
| Get-Children | ls | ls | |
| Test-Connection | ping | ping | |
| Get-Content | cat | cat | |
| Get-Command | gcm | type, which | |
| Get-Help | help, man | apropos, man | |
| Clear-Host | clear | clear | |
| Copy-Item | cp | cp | |
| Move-Item | mv | mv | |
| Remove-Item | rm | rm, rmdir | |
| Rename-Item | mv | mv | |
| Get-Location | pwd | pwd | |
| Pop-Location | popd | popd | |
| Push-Location | pushd | pushd | |
| Set-Location | cd | cd | |
| Tee-Object | tee | tee | |
| Write-Output | echo | echo | use it if you want to pipe it |
| Write-Host | | | use it if you want to output something directly |
| Get-Process | ps | ps | |
| Stop-Process | kill | kill | |
| Select-String | sls | find, grep | |
| Set-Variable | set | export, env, set, setenv | |
| Invoke-WebRequest | iwr | wget, curl | |

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

# Links

* [PowerShell - wikipedia.org](https://en.wikipedia.org/wiki/PowerShell) - 2020-01-27
