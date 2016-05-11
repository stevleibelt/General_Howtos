# convert flv to mp4

```
ffmpeg -i <file name>.flv -vcodec copy -acodec copy <file name>.mp4
```

# convert mp4 to avi

```
#maybe this is working already
ffmpeg -i <file name>.mp4 -vcodec copy -acodec copy <file name>.avi
#otherwise, take the long road
ffmpeg -i <file name>.mp4 -vcodec mpeg4 -acodec ac3 -ar 48000 -ab 192k <file name>.avi
```

# convert a bunch of files

```
for ITERATOR in *.mp4; do ffmpeg -i "${ITERATOR}" <insert your ffmpeg options in here> "${ITERATOR%.mp4}.avi"; done
```

# create slide show from images

## example

```
#-framerate = frames per seconds
#-i = input picutre files (must share the same size and format)
ffmpeg -framerate 5 [-start_number 123] -i image-%03d.png [-i music.mp3] -c:v libx264 -r 30 -pix_fmt yuv420p out.mp4
```

# extract audio only

```
#hint, use mediainfo to find the right file suffix
ffmpeg -i <file name>.mp4 -vn -acodec copy <output audio file name>.aac
```

# extract video only

```
#hint, use mediainfo to find the right file suffix
ffmpeg -i <file name>.mp4 -an -vcodec copy <output video file name>.mp4
```

# combine audio and video

```
#hint, use -ss before your input file to seek to a position
#e.g. you want to seek your video file nine seconds in the future, use "-ss 00:00:09" before the "-i"
ffmpeg -i <video file name>.mp4 -i <audio file name>.acc  -c:v copy -c:a copy <output file name>.mp4
```

# options

* -an - disable audio output
* -vn - disable video output

## source

* https://www.ffmpeg.org/faq.html#SEC14
* https://trac.ffmpeg.org/wiki/Create%20a%20video%20slideshow%20from%20images
* http://linuxcommando.blogspot.de/2014/06/create-slide-show-from-pictures-part-1.html
* https://superuser.com/questions/762409/create-video-from-jpg-images-using-ffmpeg
* https://superuser.com/questions/624567/ffmpeg-create-a-video-from-images

# links

* https://www.ffmpeg.org/faq.html
* https://trac.ffmpeg.org/wiki/
* https://wiki.archlinux.org/index.php/FFmpeg#Two-pass_MPEG-4_.28very_high_quality.29
* http://www.upubuntu.com/2012/02/how-to-convert-mp4-to-avi-under-ubuntu.html
