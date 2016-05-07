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

# options

* -an - disable audio output

## source

* https://www.ffmpeg.org/faq.html#SEC14
* https://trac.ffmpeg.org/wiki/Create%20a%20video%20slideshow%20from%20images
* http://linuxcommando.blogspot.de/2014/06/create-slide-show-from-pictures-part-1.html
* https://superuser.com/questions/762409/create-video-from-jpg-images-using-ffmpeg
* https://superuser.com/questions/624567/ffmpeg-create-a-video-from-images

# links

* https://www.ffmpeg.org/faq.html
* https://trac.ffmpeg.org/wiki/
* http://www.upubuntu.com/2012/02/how-to-convert-mp4-to-avi-under-ubuntu.html
