# Mplayer

## Configuration

### Files

```
#simple key=value configuration
#global for all users
/etc/mplayer/*

#local for your user
~/.mplayer/config
```

## Examples

### Create playlist

```
#create a playlist
find . -iname \*.mp3 -type f > my_mp3_playlist.txt

#listen to the playlist
mplayer -playlist my_mp3_playlist.txt

#with shuffle
mplayer -shuffle -playlist my_mp3_playlist.txt

```

### Random or shuffel

```
mplayer -shuffle -playlist my_playlist
mplayer -shuffle my/audio/directory/*
```

## Links

* https://wiki.archlinux.org/index.php/MPlayer
* http://mplayerhq.hu/DOCS/man/en/mplayer.1.html#CONFIGURATION%20FILES
* https://wiki.archlinux.org/index.php/Hardware_video_acceleration

