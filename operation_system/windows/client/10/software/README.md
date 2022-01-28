# Usefull build in tools

## Things you could start with Win+R+

| File to start | Description
| --- | --- |
| WIN+R+control | control panel |
| WIN+R+services.msc | windows service manager |
| WIN+R+msconfig.exe | old configuration dialog for sytem boot up |
| rstrui.exe | restore manager |
| regedt32.exe | registry manager |
| resmon.exe | resource monitor (advanced task manager) |
| perfmon.exe | performence monitor |
| appwiz.cpl | software center (to remove software) |
| eventvwr.exe | event viewer, kind of syslog for windows |
| msinfo32.exe | system information for hardware, drivers etc. |
| compmgmt.msc | computer management (includes task scheduler, event viewer, performance etc. |
| systeminfo.exe | command line system information |
| gpedit.msc | dialog to edit group policys |
| dxdiag | directx diagnostic tool - great to identify the graphic card |
| Snip & Scatch | Screen-capture tool (slice out a part from your desktop |

## List all available provisioned packages

```
#@see: https://docs.microsoft.com/en-us/windows/application-management/provisioned-apps-windows-client-os
Get-AppxProvisionedPackage -Online | Format-Table DisplayName, PackageName
```

## Install a package for all users

```
cd "C:\Program Files\WindowsApps"
cd <Package Name>
Add-AppxPackage -register .\apxmanifest.xml -DisableDevelopmentMode
```

## Install all packages for all users

```
Get-AppxPackage -allusers | foreach {Add-AppxPackage -register “$($_.InstallLocation)\appxmanifest.xml” -DisableDevelopmentMode}
```

## Remove bloatware

```
#/usr/bin/env pwsh
####
# Remove bloatware from windows 10
####
# @since 2020-07-15
# @author artodeto@bazzline.net
####

#bo: setup
$oldVerbosePrefence         = $VerbosePreference

#access all installed apps with `shell:appsfolder`
#you have to maintain this list on your self
lphatetically order
$arrayOfPackageNamePattern = @(
    "3dbuilder",
    "alarms",
    "amazon",
    #"appconnector",
    #"appinstaller",
    "bing", #bingweather, news, sports and money
    "booking",
    "communicationsapps",   #skype and messaging
    "connectivitystore",
    "dropbox",
    "feedbackhub",
    "hpaudio",
    "hpinc",
    "hpjumpstarts",
    "hpprintcontrol",
    "hpprivacysettings",
    "hpsupportassistant",
    "hpsystemeventutility",
    "holographic",
    "linkedin",
    "mcafee",
    "messaging",
    "Microsoft.Bingweather",
    "Microsoft.Getstarted",
    "Microsoft.Office.OneNote",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.Print3D",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.ScreenSketch",
    "Microsoft.SkypeApp",
    "Microsoft.windowscommunicationapps",
    "Microsoft.WindowsMaps",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGameCallableUi",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.Yourphone",
    "Microsoft.ZuneMusic",
    "netflix"
)
#eo: setup

#bo: main
$VerbosePreference = "Continue"

Write-Verbose ":: Working with AppxPackage"
ForEach ($packageName IN $arrayOfPackageNamePattern) {
    $packageNameWithWildcards = ("*" + $packageName + "*")

    Write-Verbose ("   Trying to search and remove following package >>" + $packageNameWithWildcards + "<<.")
    Get-AppxPackage -AllUsers -Name $packageNameWithWildcards | Foreach-Object {
        If ($_.NonRemovable -eq $false) {
            Remove-AppxPackage -AllUsers $_.PackageFullName
            If ($?) {
                Write-Host ("   Couldt not remove package >>" + $_.Name + "<< Package Full Name >>" + $_.PackageFullName + "<<.") -ForegroundColor Red
            }
        }
    }
}

Write-Verbose ":: Working with AppxProvisionedPackage"
ForEach ($packageName IN $arrayOfPackageNamePattern) {
    $packageNameWithWildcards = ("*" + $packageName + "*")

    Write-Verbose ("   Trying to search and remove following package >>" + $packageNameWithWildcards + "<<.")
    Get-AppxProvisionedPackage -Online | Where-Object { $_.PackageName -like $packageNameWithWildcards  } | ForEach-Object {
        Remove-AppxProvisionedPackage -Online -AllUsers $_.PackageName
        If ($?) {
            Write-Host ("   Couldt not remove package >>" + $_.Name + "<< Package Full Name >>" + $_.PackageFullName + "<<.") -ForegroundColor Red
        }
    }
}

$VerbosePreference = $oldVerbosePrefence
```

# List of useful software

* [Alacritty](https://github.com/alacritty/alacritty) - Fastest terminal emulator
* [Chocolatey](https://chocolatey.org/) - Command line packagemanager for windows
* [CleanmrgPlus](https://github.com/mirinsoft/CleanmgrPlus) - Cleanmgr+ is a portable app that builds upon the Microsoft Disk Clean-up Tool (Cleanmgr.exe) by adding additional features and deleting more junk than the Disk Clean-up Tool. (2020-01-27)
* [CloneApp](https://github.com/mirinsoft/CloneApp) - CloneApp is a free portable and simple backup tool which could save you a lot of time when migrating your software or reinstalling Windows. (2020-01-27)
* [ConEmu](https://conemu.github.io/) - Like LXTerminal for windows (low memory footprint, and low cpu usage)
* [Debotnet](https://github.com/mirinsoft/debotnet) - A free and portable tool for controlling Windows 10's many privacy-related settings and keep your personal data private. (2020-01-27)
* [Extraterm](https://extraterm.org/) - Swiss army chainsaow of terminal emulators
* File synchronisation/management software
    * [Bart: Backup files and folders by synchronising just changes - portable application](https://www.zhornsoftware.co.uk/bart/) - 2020-02-26
    * [Create Synchronicity - Backup & Sync](https://sourceforge.net/projects/synchronicity/) - 2020-02-26
    * [SyncFolders](http://www.syncfolders.elementfx.com/) - 2020-02-26
    * [Synkron](https://sourceforge.net/projects/synkron/) - 2020-02-26
* [Snappy Driver Installer Origin](https://www.snappy-driver-installer.org/download) - Open source windows driver updater utility - 20202-04-25
* [Terminus](https://eugeny.github.io/terminus/) - Highly configurable terminal emulator
