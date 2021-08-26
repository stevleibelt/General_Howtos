# This is connected to the generic error `0x00000057`

## Basic knowledge

* You have to know how to start and stop the printer spooler service
    * `WIN`+`R` -> `cmd` -> `SHIFT`+`ENTER` (to start it as administrator)
        * `net start spooler`
        * `net stop spooler`
    * \_or
    * `WIN`+`S`-> `services.msc` -> `SHIFT`+`ENTER` (to start is as administrator)
        * search for `Printer Spooler`
        * rightclick on it and either choose `start` or `stop`
* Open the `printer management`
    * `WIN`+`s` -> `printermanagement.msc` -> `SHIFT`+`ENTER` (to start it as administrator)
* Open the printui command
    * `WIN`+`R` -> `cmd` -> `SHIFT`+`ENTER` (to start it as administrator)
    * `printui.exe`
* Where are the drivers stored on your printserver (if needed)
    * `\\<print server>\print$\x64\PCC`
* Last but not least, there are multiple ways
* Drivers are located in `C:\Windows\System32\DriverStore\FileRepository`
* Not finished print jobs are stored in `C:\Windows\System32\spool\PRINTERS`. It can be that you have to stop the spooler and empty this directory to remove driver lock

## techjourney solution

[source](https://techjourney.net/failure-unable-to-delete-or-remove-printer-driver-package-currently-in-use/) - 2020-06-16

* open `printer management` (`WIN`+`R` -> `services.msc`)
* naviagte to `Print Server` -> `<Computer Name> (local)` -> Drivers
* right click on the printer driver you want to delete and select `Remove Driver Package` (Do NOT click on `delete` yet)
* open services administration tool (`WIN`+`R` -> `services.msc`)
* `Stop` the `Printer Spooler` service
* `Start` the `Printer Spooler` service AND richt click on the printer driver you want to delete and select `delete`
* restart computer on successful removal or try steps again

## bwit.blog solution

[source](https://bwit.blog/the-specified-printer-driver-is-currently-in-use/)

### first solution

* stop the print spooler service
* open `printer management`
* naviagte to `Print Server` -> `<Computer Name> (local)` -> All Drivers 
* right click on the printer driver you want to delete and select `delete`

### second solution

* go to `Devices and Printers` and remove the printer
* stop the `print spooler` service
* open regedit and go to the following key:
* `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Print Processors\`
* re-name all print processors you see here, such as: Winprint to Winprint.old, Hpcpp107 to Hpcpp107.old, and so on …
* start the `print spooler` service
* open `printer management` and remove the full printer driver package
* open the registry again and go again to the following key:
* `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Print Processors\`
* rename all print processors to `OLD` or `<current date>`
* restart the `print spooler`
* reinstall the new drivers and test again

### third solution

* open `printer management`
* in `View tab` Select `Custom View` and tick `Console tree` and `Action panel` (not mandatory)
* within `All Drivers` navigate to your printer driver (the one to be deleted): (Print Management > Custom Filters > All Drivers)
* right click your printer (in `Driver Name` column)
* from the `Driver Isolation` drop-down menu, select `Isolated`
* within `All Printers` navigate to your printer (the one to be deleted)
* right click your printer (in `Printer Name` column)
* select `Properties` (or `Manage Sharing`)
* in `Sharing` tab, de-select `Share this printer` and select `Apply` (Then patiently wait for it to `apply`)
* in `Advanced` tab, select `Print directly to the printer` and select `Apply` (Then patiently wait for it to `apply`) [This disables spooling (for this printer), so you can leave the `Print spooler` (`Spooler` in Task Manager) service still running]
* within `All Printers` right click your printer and perform `Delete`
* within `All Drivers` right click your printer and perform `Delete`
* if still not fixed, also try this: In `Properties` > `Security` tab, allow `Manage this printer`

## windowscentral.com

[source](https://www.windowscentral.com/how-properly-remove-printer-windows-10)

### via cmd

```
#`WIN`+`R` -> `cmd` -> SHIFT+ENTER (run as administrator)
#list all available printers
wmic printer get name

printui.exe /dl /n "<full qualified printer name>"
```

### via powershell

```
#`WIN`+`S` -> `PowerShell` -> SHIFT+ENTER (run as administrator)
#list available printers
Get-Printer

#remove printer
Remove-Printer -name "<full qualified printer name>"

#remove printer driver
Get-PrinterDriver

Remove-PrinterDriver -Name "<full qualified printer name>"
#if you get the error message that the driver is still in use
#   but there is no printer available anymore
Restart-Service Spooler
Remove-PrinterDriver -Name "<full qualified printer name>"
```

# links

* [can not connect to the printer - microsoft.com](https://social.technet.microsoft.com/Forums/itmanagement/en-US/a225d71c-be8b-4530-bf50-63001559a978/windows-can-not-connect-to-the-printer-0x00000057?forum=itmanager) - 2020-06-16
* [print jobs may not print - microsoft.com](https://support.microsoft.com/de-de/help/2771931/print-jobs-in-a-point-and-print-environment-may-not-print-with-the-cor) - 2020-06-16
* [Fix 0x00000057 - woshub.com](http://woshub.com/fix-windows-cannot-connect-to-the-printer-error-0x00000057/) - 2020-06-16
* [bat file to fix the issue](https://github.com/PeterCheungHK/Fix_0x00000057_Error) - 2020-06-16
