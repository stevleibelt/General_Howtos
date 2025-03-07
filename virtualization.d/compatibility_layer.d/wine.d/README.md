# WINE

## How to

### Install and uninstall

```bash
# As example for a steam application, else it would be /home/myuser/.wine
# install
WINEPREFIX=/home/my_user/.steam/steam/steamapps/compatdata/<int: app_id>/pfx/ wine /path/to/the.exe

# uninstall
WINEPREFIX=/home/my_user/.steam/steam/steamapps/compatdata/<int: app_id>/pfx/ wine uninstaller
# optional regedit
WINEPREFIX=/home/my_user/.steam/steam/steamapps/compatdata/<int: app_id>/pfx/ wine regedit
# remove directory if needed
rm -fr /home/my_user/.steam/steam/steamapps/compatdata/<int: app_id>/pfx/drive_c/Programm\ Files/<string: application>
```

### No sound in games

* Run `winecfg`
* Go to audio settings
* Select fitting audio device like `Pulse Audio`
* Click on `Test sound`

## Link

* [performance](https://wiki.winehq.org/Performance)
* [archlinux wiki](https://wiki.archlinux.org/index.php/Wine)
