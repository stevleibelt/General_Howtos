# FFMPG

## Convert flv to mp4

```
ffmpeg -i <input file name>.flv -vcodec copy -acodec copy <output file name>.mp4
```

## Convert mp4 to avi

```
#maybe this is working already
ffmpeg -i <input file name>.mp4 -vcodec copy -acodec copy <output file name>.avi
#otherwise, take the long road
ffmpeg -i <input file name>.mp4 -vcodec mpeg4 -acodec ac3 -ar 48000 -ab 192k <output file name>.avi
```

## Convert a bunch of files

```
for ITERATOR in *.mp4; do ffmpeg -i "${ITERATOR}" <insert your ffmpeg options in here> "${ITERATOR%.mp4}.avi"; done
```

## Cut out first ten minutes

```
ffmpeg -i source-file.foo -ss 0 -t 600 first-10-min.m4v
```

## Create slide show from images

### Example

```
#-framerate = frames per seconds
#-i = input picutre files (must share the same size and format)
ffmpeg -framerate 5 [-start_number 123] -i image-%03d.png [-i music.mp3] -c:v libx264 -r 30 -pix_fmt yuv420p out.mp4
```

## Extract audio only

```
#hint, use mediainfo to find the right file suffix
ffmpeg -i <input file name>.mp4 -vn -acodec copy <output audio file name>.aac
```

## Extract video only

```
#hint, use mediainfo to find the right file suffix
ffmpeg -i <input file name>.mp4 -an -vcodec copy <output video file name>.mp4
```

## Combine audio and video

```
#hint, use -ss before your input file to seek to a position
#e.g. you want to seek your video file nine seconds in the future, use "-ss 00:00:09" before the "-i"
ffmpeg -i <video input file name>.mp4 -i <audio file name>.acc  -c:v copy -c:a copy <output file name>.mp4
```
## Encodes all video streams with libx264 and copies all audio streams

```
#For each stream, the last matching "c" option is applied, so

#encodes all video streams with libx264 and copies all audio streams.
ffmpeg -i <input file name> -map 0 -c:v libx264 -c:a copy <output file name>

#copy all the streams except the second video, which will be encoded with libx264, and the 138th audio, which will be encoded with libvorbis.
ffmpeg -i <input file name> -map 0 -c copy -c:v:1 libx264 -c:a:137 libvorbis <output file name>
```

## Options

* -an - disable audio output
* -vn - disable video output

### Source

* https://www.ffmpeg.org/faq.html#SEC14
* https://trac.ffmpeg.org/wiki/Create%20a%20video%20slideshow%20from%20images
* http://linuxcommando.blogspot.de/2014/06/create-slide-show-from-pictures-part-1.html
* https://superuser.com/questions/762409/create-video-from-jpg-images-using-ffmpeg
* https://superuser.com/questions/624567/ffmpeg-create-a-video-from-images

## Links

* https://www.ffmpeg.org/faq.html
* https://trac.ffmpeg.org/wiki/
* https://wiki.archlinux.org/index.php/FFmpeg#Two-pass_MPEG-4_.28very_high_quality.29
* http://www.upubuntu.com/2012/02/how-to-convert-mp4-to-avi-under-ubuntu.html
* https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
* [ultimate guide to ffmpeg](https://img.ly/blog/ultimate-guide-to-ffmpeg/) - 20221129

