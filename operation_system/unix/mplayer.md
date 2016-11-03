# configuration

## files

```
#simple key=value configuration
#global for all users
/etc/mplayer/*

#local for your user
~/.mplayer/config
```

# examples

## create playlist

```
ls *.mp3 > my_playlist
mplayer -playlist my_playlist
```

## random or shuffel

```
mplayer -shuffle -playlist my_playlist
mplayer -shuffle my/audio/directory/*
```

# links

* https://wiki.archlinux.org/index.php/MPlayer
* http://mplayerhq.hu/DOCS/man/en/mplayer.1.html#CONFIGURATION%20FILES
* https://wiki.archlinux.org/index.php/Hardware_video_acceleration
