# howto

* install sane
* echo “” >> /etc/sane.d/fujitsu.conf
* echo “#ScanSnap s1300i” >> /etc/sane.d/fujitsu.conf
* echo “usb 0x04c5 0x1155” >> /etc/sane.d/fujitsu.conf
* cd /usr/share/sane/epjitsu/
* wget https://github.com/ckunte/scansnap-firmware/raw/master/1300i_0D12.nal
* use simple-scan, sane or xsane
* vim /etc/sane.d/epjitsu.conf #if needed

# links

* https://github.com/ckunte/scansnap-firmware
* http://www.documentsnap.com/fujitsu-scansnap-in-linux/
* http://www.fujitsu.com/global/support/products/computing/peripheral/scanners/scansnap/manuals/s1300i.html
* http://www.fujitsu.com/global/support/products/computing/peripheral/scanners/scansnap/software/s1300i.html
