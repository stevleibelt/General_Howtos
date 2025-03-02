# Scan under linux

## Packages

* sane
* xsane
* [simple-scan] #simple gui for xsane
* [xsane-gimp]
* [gocr]    #simple gui for orc

## Check if your device is supported

```bash
sane-find-scanner
#or
scanimage -L
```

## Scan on the commandline

```bash
scanimage -d [device name] format=tiff mode Lineart resolution
300 > [filename]
```

## Using gimp

* File -> create -> XSANE:<your device>

# Links

* https://wiki.archlinux.org/index.php/Scan
* https://www.gadgetdaily.xyz/how-to-get-started-with-the-google-maps-api/
