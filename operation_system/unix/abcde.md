# installation

* install needed codes (flac, lame, mkcue, mp3gain, speex, vorbis-tools, vorbisgain, cdparanoid, id, id3v ...)

# usage

## rip cd as mp3

    abcde -o mp3

# configuration

* search for "abcde.conf" and copy it in your $HOME
* set "OUTPUTTYPE=mp3"
* set "OUTPUTDIR"
* set MP3/OGG/... options (LAMEOPTS='-- preset standard')
* set "PADTRACKS=y" (add leeding zero for track numbers 1 to 9)
* rip mp3 via lame "MP3ENCODERSYNTAX='lame'"
* set output file format "OUTPUTFORMAT='${ARTISTFILE}_-_${ALBUMFILE}/${TRACKNUM}_-_${TRACKFILE}'"
* enable normalization "NORMALIZE=normalize-audio"

# links

* http://wiki.ubuntuusers.de/abcde
* http://ubuntuforums.org/showthread.php?t=109429
