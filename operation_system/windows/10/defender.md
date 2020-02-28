# Windows defender

## How to clean all signatures and update

```
#using MpCmdRun.exe
cd "C:\ProgramFiles\Windows Defender"
.\MpCmdRun.exe -RemoveDefinitions -All
.\MpCmdRun.exe -SignatureUpdate

#using powershell
Update-MpSignature
```

# Links

* [Downloadlink for clean microsoft defender mpam-fe.exe - microsoft.com](https://www.microsoft.com/en-us/wdsi/defenderupdates) - 2020-02-20
* [Defender module for PowerShell - microsoft.com](https://docs.microsoft.com/en-us/powershell/module/defender/) - 2020-02-20
