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

# Links

* [Checkpoint-Computer](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/Checkpoint-Computer)
* [GetComputerRestorePoint](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/Get-ComputerRestorePoint)
* [Restore-Computer](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/Restore-Computer)
