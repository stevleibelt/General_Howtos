# Setup

## Enable webp support

```
#enable thumbnails in nautilus
#@see:
#   https://askubuntu.com/questions/617047/how-to-preview-dds-and-webp-images-on-nautilus - 20210505
cat >/usr/share/thumbnailers/webp.thumbnailer<<DELIM
[Thumbnailer Entry]
Exec=/usr/bin/dwebp %i -scale 100 100 -o %o
MimeType=image/x-webp;image/webp;
DELIM

#enable eye of gnome support
#@see:
#   https://www.reddit.com/r/linuxquestions/comments/5ymj6d/no_webp_support_in_eye_of_gnome/ - 20210505
#install webp-pixbuf-loader
```
