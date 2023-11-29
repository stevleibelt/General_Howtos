# set speed / reduce noize

```
#12 is good
#4 is super silent
eject -x 12 /dev/sr0
```

# dvd

## on the command line

```
#assuming your optical device is /dev/sr0
dd if=/dev/sr0 of=<file path name of your dvd>.iso
#@todo
```

## ripping

### with divxenc

```
#install mkvtoolnix to be able to encode to mp4
#mkvtoolnix-cli
#or
#mkvtoolnix-gui

### with ffmpeg

```
#assuming you have mounted your dvd to /mnt
cat $(ls /mnt/VIDEO_TS/*.VOB) | nice ffmpeg -i - -acodec libmp3lame -ac 2 -aq 4 -vcodec libx264 -crf 20 -threads 0 <your file name>.mkv
```

### with divxenc

```
divxenc -2p -p vhq
```

# blu ray

```
#install
makemkv-libaacs
```

# links

* https://wiki.archlinux.org/index.php/Optical_disc_drive
* https://wiki.archlinux.org/index.php/MEncoder
* https://wiki.archlinux.org/index.php/FFmpeg
* https://wiki.ubuntuusers.de/DVDs_rippen/
* http://www.cyberciti.biz/tips/linux-dvd-ripper-software.html
