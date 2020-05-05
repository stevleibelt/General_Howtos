# Activate office

## Via ospp.vbs

You have to use the script "ospp.vbs".

This script is located in your installation path.
As example for Microsoft Office 13, the path is `c:\Program Files (x86)\Microsoft Office\Office15`.
You have to start it by prefixing it with the `cscript` command.

```
#general syntax is
#   cscript ospp.vbs [Option:Value] [ComputerName] [User] [Password]
#You can use the same syntax in the powershell, no Start-Process needed!
#list help
cscript "c:\Program Files (x86)\Microsoft Office\Office15\ospp.vbs" /?
#set activation key
cscript "c:\Program Files (x86)\Microsoft Office\Office15\ospp.vbs" /inpkey:<key>
#start activation
#note: you have to restart the office application to see that it is activated.
cscript "c:\Program Files (x86)\Microsoft Office\Office15\ospp.vbs" /act
```

## Via slmgr.vbs

This only works if you have a Office KMS (Key Management Server) host.

```
#activate
#the product you want to activate is identified by the product key
slmgr.vbs /ipk <product key>
```

# link

* [obpp.vbs on docs.microsoft.com](https://docs.microsoft.com/en-us/DeployOffice/vlactivation/tools-to-manage-volume-activation-of-office) - 2020-05-05
