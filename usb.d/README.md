# USB

## Null Modem

```bash
#should contain something like Null Modem cable, FT232RL, Serial Device converter
lsusb

#connect
sudo tio /dev/ttyUSB1
#or
sudo agetty -L 115200 ttyUSB linux
#or
sudo agetty -L 9600 ttyUSB linux
```

