# for arch linux

* sudo pacman -S bluez
* sudo pacman -S bluez-utils
* sudo pacman -S bluedevil (if you want to have a gui)
* sudo systemctl enable bluetooth.service

# add audio support

* cat > /etc/bluetooth/audio.conf <<DELIM
[General]
Enable=Source
DELIM
* open /usr/lib/systemd/system/bluetooth.service
* replace >>ExecStart=/usr/lib/bluetooth/bluetoothd<<
* with >>ExecStart=/usr/lib/bluetooth/bluetoothd --plugin=policy<<
* sudo pacman -S pulseaudio-bluetooth (if you are using pulseaudio)
* sudo systemctl restart bluetooth.service
* pulseaudio -k

# connect to a device

* bluetoothctl
* power on
* scan on
* devices
* pair <mac address>
* trust <mac address>
* connect <mac address>

# links

* [Bluetooth: "protocol not available"](https://bbs.archlinux.org/viewtopic.php?id=222083)
* [Using your computer's speakers as a bluetooth headset](https://wiki.archlinux.org/index.php/bluetooth#Using_your_computer.27s_speakers_as_a_bluetooth_headset)
* [Audio](https://wiki.archlinux.org/index.php/bluetooth#Audio)
* [Bluetooth headset](https://wiki.archlinux.org/index.php/Bluetooth_headset)
