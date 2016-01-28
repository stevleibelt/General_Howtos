# hp

hp printers are special.

You need to install the "[HPLIP](http://hplipopensource.com/hplip-web/models/color_laserjet/hp_laserjet_200_colormfp_m276nw.html)".

# installing a printer

Right before your install the printer, you have to find the fitting "PPD" file.

You either have it on your system in */usr/share/ppd/HP/* or you have to search in the web for it.
Copy and paste the fitting file in your */tmp* path and unzip it. You need to provie the path to the file later one

```
sudo hp-setup
```
