# ffmpeg
## based on: http://superuser.com/questions/227338/how-to-convert-an-mkv-to-avi-with-minimal-loss

## copy video and audio stream without quality loss

    ffmpeg -i file.mkv -c:v copy -c:a copy file.avi

## let ffmpeg choose

    ffmpeg -i file.mkv file.avi

# mencoder
# based on: http://www.linuxforen.de/forums/showthread.php?t=269196

    mencoder -oac copy -ovc copy -of avi -o file.avi file.mkv
