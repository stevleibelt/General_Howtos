# Create a (temporary) administrator account

```
#open command prompt or powershell as administrator
#@see: https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc771865(v=ws.11)
net user <string: username> [<string: password>] /add

#your admin group name differes depending on your localization
#@see: https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc725622(v=ws.11)
net localgroup Administrators <string: username> /add
```
