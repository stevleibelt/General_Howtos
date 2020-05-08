# How to install software

## General

```
#check if software is installed
#@see: https://keestalkstech.com/2017/10/powershell-snippet-check-if-software-is-installed/
#@see: https://morgantechspace.com/2018/02/check-if-software-program-is-installed-powershell.html

$software = "firefox"
#modern installation routines are listed here
$isInstalled = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software  }) -ne $null

#we have to handle a windows 64bit a bit differently
##this is the node where x86 32 bit software is stored
if (-Not $isInstalled) {
    if (Test-Path "HKLM:Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall") {
        $isInstalled = (Get-ItemProperty HKLM:Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null
    }
}

#but we also have to check a legacy place
if (-Not $isInstalled) {
    #this is used for older installation routines
    $isInstalled = (Get-WmiObject -Class Win32_Product | WHERE { $_.Name -like "*$name*" })
}

if (-Not $isInstalled) {
    Write-Host $(">>" + $software + "<< is not installed.")
} Else {
    Write-Host $(">>" + $software + "<< is installed.")
}
```

# How to uninstall software

## General

```
#Get GUID of an installed microsoft software package by its name
$listOfGUID = (Get-ItemProperty HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -Like '*microsoft*'  }).PSChildName

#Uninstall software by GUID
Start-Process msiexec.exe -ArgumentList "/X $listOfGUID /quiet /l*v C:\Logs\my_uninstall.log" -Wait
```

## Remove Microsoft Teams

```
#@see:
#   https://community.spiceworks.com/how_to/161502-uninstall-microsoft-teams-from-all-users-on-a-pc
#   https://www.reddit.com/r/PowerShell/comments/cmgpzt/actually_uninstall_microsoft_teams/

#check if teams is installend
if (test-path C:\Users\*\AppData\Local\Microsoft\Teams\current\Teams.exe) {
    #1.) stop programm
    kill -name teams -force;
    #2.) uninstall it
    (Get-ItemProperty C:\Users\*\AppData\Local\Microsoft\Teams\Current).PSParentPath | foreach-object {Start-Process $_\Update.exe -ArgumentList "--uninstall /s" -PassThru -Wait}
} 
```
