# How to install

# By PowerShell

```
#Installs all online available but local missing RSAT-Tools
Get-WindowsCapability -Name RSAT* -Online | where State -EQ NotPresent | Add-WindowsCapability –Online
```

# By Hand

```
Win+S
enter "Settings" and open it
Select "Apps"
Select "Optional features"
Select "Add a feature"
Install each feature prefixed with RSAT
```

# Links

* [Installing RSAT Administration Tools on Windows 10 and 11](http://woshub.com/install-rsat-feature-windows-10-powershell/) - 20210914
* [Remote Server Administration Tools (RSAT) for Windows operating systems - microsoft.com](https://support.microsoft.com/en-us/help/2693643/remote-server-administration-tools-rsat-for-windows-operating-systems) - 20200117
