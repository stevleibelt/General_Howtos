# Migrate sticky notes from Windows 7 to Windows 10

* on your windows 7 system:
    * backup your file from: `C:\Users\<username>\AppData\Roaming\Microsoft\Sticky Notes\StickyNotes.snt`
* on your windows 10 system:
    * go to `Apps & Features` -> `Sticky Notes` -> `Advanced Options` and click `Reset`
    * create the following path: `C:\Users\<username>AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\Legacy`
    * copy the file `StickyNotes.snt` into the new created directory path and rename it to `ThresholdNotes.snt`
    * start sticky notes

# Links

* [Migrating Sticky Notes from 7 to 10](https://answers.microsoft.com/en-us/windows/forum/apps_windows_10-winapps-appscat_books/migrating-sticky-notes-from-7-to-10/86aabe27-120c-4ddd-8fff-aa0f5128af33) - 20200806
