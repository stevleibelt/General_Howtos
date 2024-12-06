# Optical disc device handling under linux

## Set speed / reduce noize

```bash
#12 is good
#4 is super silent
eject -x 12 /dev/sr0
```

## DVD

### Create a iso file from a dvd

```bash
# Assuming your optical device is /dev/sr0
dd if=/dev/sr0 of=<file path name of your dvd>.iso
#@todo
```

### Ripping

```bash
# With divxenc
#install mkvtoolnix to be able to encode to mp4
#mkvtoolnix-cli
#or
#mkvtoolnix-gui

# With ffmpeg
#assuming you have mounted your dvd to /mnt
cat $(ls /mnt/VIDEO_TS/*.VOB) | nice ffmpeg -i - -acodec libmp3lame -ac 2 -aq 4 -vcodec libx264 -crf 20 -threads 0 <your file name>.mkv

# With divxenc
divxenc -2p -p vhq
```

## Blu ray

```bash
#install
makemkv-libaacs
```

## Links

* https://wiki.archlinux.org/index.php/Optical_disc_drive
* https://wiki.archlinux.org/index.php/MEncoder
* https://wiki.archlinux.org/index.php/FFmpeg
* https://wiki.ubuntuusers.de/DVDs_rippen/
* http://www.cyberciti.biz/tips/linux-dvd-ripper-software.html
