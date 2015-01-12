# automatic repair damaged drive

    fsck -a <drive> #fsck will not ask anything! think about if this is really what you want

# repair damaged drive

    fsck -r <drive>

# get current mount count

    dumpe2fs -h <drive> | grep -i 'mount count'

# changing check frequency

    tune2fs -c 20 <drive> #set frequency to 30, 0 means never, 1 means every boot

# links

* https://wiki.archlinux.org/index.php/fsck
* http://www.thegeekstuff.com/2012/08/fsck-command-examples/
* http://www.cyberciti.biz/faq/linux-force-fsck-on-the-next-reboot-or-boot-sequence/
