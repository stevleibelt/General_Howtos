# How to export windows drivers

```
#by using dism
#make sure the path destination exists!
dism /online /export-driver /destination:<path>

#by using powershell
Export-WindowsDriver -Online -Destination <path>
```

# How to import windows drivers

```
#by using pnputil
pnputil.exe /add-driver <path>\*.inf /subdirs /install

#by using powershell
Add-WindowsDriver -Path <path to your windows image> -Driver <path to the drivers> -Recurse
```

# Link

* [Treiber unter Windows in Ordner exportieren und wieder importieren](https://www.borncity.com/blog/2021/08/10/treiber-unter-windows-in-ordner-exportieren-und-wieder-importieren/) - 20210810
* [Windows Treiber exportieren mit PowerShell](https://www.itnator.net/windows-treiber-exportieren-mit-powershell/) - 20210810
* [Windows Treiber importieren mit PowerShell](https://www.itnator.net/windows-treiber-importieren-mit-powershell/) - 20210810
