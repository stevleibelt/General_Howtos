# steps

* download windows 10 2004 iso file
* download and install `windows-adk`
* mount iso and copy `sources\install.wim` to your local working directory
* start `windows system image manager`
* `file` -> `open windows image` and select your `install.wim`
* hit `ok` to create a `clg` file
* from the `Windows Image` panel, select toe following two and drag them into the `Answer File` panel below `7 oobeSystem`
    * `amd64_Microsoft-Windows-International-Core_10.0.<Build-Nummer>_neutral`
    * `amd64_Microsoft-Windows-Shell-Setup_10.0.<Build-Nummer>_neutral`
* Select `amd64_Microsoft-Windows-International-Core_10.0.<Build-Nummer>_neutral` from `7 oobeSystem` and input following values for a german default
    * InputLocale: 0407:00000407
    * SystemLocale: de-DE
    * UILanguage: de-DE
    * UILanguageFallback: en-US
    * UserLocale: de-DE
* Select `amd64_Microsoft-Windows-Shell-Setup_10.0.<Build-Nummer>_neutral` from `7 oobeSystem`
    * Select `OOBE` and input following values
        * HideEULAPage: true
        * HideLocalAccountScreen: true
        * HideOEMRegistrationScreen: true
        * HideOnlineAccountScreens: true
        * HideWirelessSetupInOOBE: true
        * ProtectYourPC: 3  #disable sending location data of device to microsoft
        * SkipUserOOBE: true
    * Select `UserAccounts` -> `LocalAccounts` -> `right click` -> `Insert New LocalAccount` and input your values (if you want to create a local administrator)
        * Description: local administrator
        * Group: Administrators
        * Name: localadmin
* Save the answer file as `unattend.xml`
* Copy it in the mounted image like `%SystemRoot%\system32\panther`
```
Dism /Mount-Image /ImageFile:"C:\wim\Custom.wim" /Index:1 /MountDir:C:\mount
Copy unattend.xml C:\mount\Windows\Panther
Dism /Unmount-Image /MountDir:C:\mount /Commit
```

# link

* [Setup von Windows 10: OOBE-Dialoge für Privatsphäre, Sprache und User-Konto überspringen mit Antwortdatei](https://www.windowspro.de/wolfgang-sommergut/setup-windows-10-oobe-dialoge-fuer-privatsphaere-sprache-user-konto-ueberspringen) - 20200707
* [Konfigurieren von Komponenten und Einstellungen in einer Antwortdatei](https://docs.microsoft.com/de-de/windows-hardware/customize/desktop/wsim/configure-components-and-settings-in-an-answer-file) - 20200707
    * [Öffnen eines Windows-Abbilds oder einer Katalog Datei](https://docs.microsoft.com/de-de/windows-hardware/customize/desktop/wsim/open-a-windows-image-or-catalog-file) - 20200707
    * [Übersicht über Windows-Abbild Dateien und Katalogdateien](https://docs.microsoft.com/de-de/windows-hardware/customize/desktop/wsim/windows-image-files-and-catalog-files-overview) - 20200707
* [Windows Language Pack Default Values](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-8.1-and-8/hh825682(v=win.10))
