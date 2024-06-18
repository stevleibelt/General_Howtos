# Recover files from file system

## Howto

### Using foremost

```bash
# ref: https://www.onli-blogging.de/2380/Geloeschte-Bilder-auf-microSD-Karte-wiederherstellen.html
# restore all jpg's from device sde1 and copy them in the relative
#   path output/jpg
foremost -v -d -t jpg -i /dev/sde1
```
