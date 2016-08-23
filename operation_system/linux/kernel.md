# how to build

```
cd path/where/i/want/to/build/the/new/kernel
download latest stable kernel from http://www.kernel.org
tar xf linux-x.x.x.tar.xz
cd linux-x.x.x
cp /boo/config/$currentKernel .config
make oldconfig
make menuconfig
make -j6 bzImage modules
sudo make modules_install install
sudo update-grub
```

# links

* http://www.kroah.com/lkn/
