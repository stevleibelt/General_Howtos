# Using the powershell

```
#list available snapshots
Get-ComputerRestorePoint
#list latest snapsho
Get-ComputerRestorePoint -RestorePoint ((Get-ComputerRestorePoint).SequenceNumber)[-1]

#create a restore point
Checkpoint-Computer [-Description] <string>

#use a snapshot
# -Confirm asks you before starting the restore
# -WhatIf show you what woudl happen if you run the restore
Restore-Computer -RestorePoint <int> [-Confirm]
```

## Example how to create a shadow copy, make it read accessable and remove it

```
#bo:create shadow copy
$shadowSourceVolume = ($env:SystemDrive + "\")
$shadowDestinationLinkPath = ($env:SystemDrive + "\shadowed_test")

#@see: https://docs.microsoft.com/en-us/previous-versions/windows/desktop/vsswmi/create-method-in-class-win32-shadowcopy#examples
$shadowCopyClass=[WMICLASS]"root\cimv2:win32_shadowcopy";

#create a shadow copy object
$shadowCopyObject = $shadowCopyClass.create($shadowSourceVolume, "ClientAccessible")
#fetch shadow object fron that
$shadowObject = Get-WmiObject Win32_ShadowCopy | Where-Object { $_.ID -eq $shadowCopyObject.ShadowID  }
#fetch 
$shadowLinkPath = $shadowObject.DeviceObject + "\"
#eo:create shadow copy

#bo:create link
cmd /c mklink /d $shadowDestinationLinkPath $shadowLinkPath
#eo:create link

#bo: remove shadow link
cmd /c rmdir /S /Q $shadowDestinationLinkPath
#eo: remove shadow link

#bo: delete shadow copy
$shadowObject.Delete();
#Remove-CimInstance -InputObject $shadowObject
#eo: delete shadow copy

#bo: FTL
#list all available shadow copies
#Get-WmiObject Win32_Shadowcopy
#eo: FTL)
```

# Links

* [Checkpoint-Computer](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/Checkpoint-Computer)
* [GetComputerRestorePoint](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/Get-ComputerRestorePoint)
* [Restore-Computer](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/Restore-Computer)
