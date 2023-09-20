# How to update using powershell

```
####
#search for updates
####
#local machine
Start-WUScan
#search for not installed software
#@see: https://docs.microsoft.com/en-us/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-search
$listOfAllUpdatesOnRemoteMachine = Start-WUScan -SearchCriteria "Type='Software' AND IsInstalled=0"

#remote machine
$listOfAllUpdatesOnRemoteMachine = Invoke-Command -ComputerName <string: netbios name> -ScriptBlock `
{Start-WU-Scan -SearchCriteria "Type='Software' AND Installed=1"}
` -Credential <domain>\<username>

####
#download updates
####
#local machine
Install-WUUpdates -Updates $listOfAllUpdatesOnRemoteMachine -DownloadOnly

#remote machine
$cimSession = New-CimSession -ComputerName <string: netbios name> -Credential <domain>\<username>
Install-WUUpdates -Updates $listOfAllUpdatesOnRemoteMachine -DownloadOnly -CimSession $cimSession

####
#install updates
####
#local machine
Install-WUUpdates -Updates $listOfAllUpdatesOnRemoteMachine

#remote machine
$cimSession = New-CimSession -ComputerName <string: netbios name> -Credential <domain>\<username>
Install-WUUpdates -Updates $listOfAllUpdatesOnRemoteMachine -CimSession $cimSession

####
#check if a reboot is needed
####
#local machine
Get-WUIsPendingReboot
#remote machine
Invoke-Command -ComputerName <string: netbios name> -ScriptBlock {Get-WUIsPendingReboot} -Credential <domain>\<username>
```

# Links

* [Control windows updates with powershell (german) - windowspro.de](https://www.windowspro.de/wolfgang-sommergut/windows-updates-powershell-abfragen-herunterladen-installieren) - 2020-03-16
