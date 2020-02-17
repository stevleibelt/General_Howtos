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
