# Versions

* N - for europe
* KN - for south korea
* SLP - only one language is installed

## What is not inside the N or KN edition?

As you well see, the N or KN version simple comes with less spy-/bloatware.
You will use an free as in freedom [webbrowser](https://www.mozilla.org/firefox) or [video player](https://www.vlc.org) anyway.

* audio cds
* digital media files
* video dvds
* organize content in a media library
* create playlists
* convert audio cds to digital media files
* view artist and title information of digital media files
* view album art of music files
* transfer music to personal music players
* record and play back tv broadcasts after
* internet explorer does not include playback for:
* adaptive streaming
* digital rights management (drm)

# fetch information about current version

```
#start cmd.exe as administrator
slmgr /dlv
#or
winver
```

# force real/full shutdown

```
shutdown /s /f /t 0
```

# Clean Up Tools

* [performance maintainer](http://www.pcstarters.net/performance-maintainer)

# Autostart

```
#current user
%appdata%\Microsoft\Windows\Start Menu\Programs\Startup

#generall 
%programdata%\Microsoft\Windows\Start Menu\Programs\Startup
```

# Keyboard Shortcuts

| Shortcut | Description |
| --- | --- |
| CTRL+SHIFT+ESC | Opens Task Manager |
| CTRL+SHIFT+ENTER | Runs your application as administrator |

# AppData

| Path | Variable | Description |
| --- | --- | --- |
| `Local` | `%localappdata%` | Contains folders related to user specific installed programms and is specific to a pc (can not be moved) |
| `LocalLow` | - | Contains pc specific data (can not be moved) and is used for programms running in `private` mode |
| `Roaming` | - | Contains programm specific data that can be moved/copied or synchronized like browser profiles |

# Links 

* [Windows 10 official iso download page](https://www.microsoft.com/en-us/software-download/windows10ISO) - 2020-04-19
    * You need to have a non windows based user agent to get the "Select Edition" page
    * [Create usb stick under linux for a windows iso with WoeUSB](https://github.com/slacka/WoeUSB) - 2020-04-24
* [How to create a WinPE ISO for Windows 10.](https://www.windowspro.de/wolfgang-sommergut/winpe-fuer-windows-10-iso-usb-stick-speichern)
* [Windows environment variables - en.wikipedia.org.](https://en.wikipedia.org/wiki/Environment_variable#Windows) - 2020-05-08
* [Recognized Environment Variables - docs.microsoft.com](https://docs.microsoft.com/en-us/windows/deployment/usmt/usmt-recognized-environment-variables) - 2020-05-08
* http://www.heise.de/newsticker/meldung/Windows-10-via-MSDN-und-Media-Creation-Tool-verfuegbar-2764593.html
* http://winsupersite.com/windows-10/what-are-windows-10-n-and-kn-editions
* https://www.quora.com/What-is-the-difference-between-Windows-10-Windows-10-KN-Windows-10-N-and-Windows-10-Single-Language?share=1
* https://www.microsoft.com/en-us/Useterms/Retail/Windows/10/UseTerms_Retail_Windows_10_german.htm
* http://www.heise.de/forum/heise-online/News-Kommentare/Windows-10-via-MSDN-und-Media-Creation-Tool-verfuegbar/Re-MSDNAA-Dreamspark/posting-21044855/show/
