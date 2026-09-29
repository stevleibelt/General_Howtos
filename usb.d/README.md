# USB

## Null Modem

```bash
# Your user should be in group uucp
if ! groups | grep -q uucp;
then
  sudo usermod -a -G uucp $(whoami)
fi

# Should contain something like Null Modem cable, FT232RL, Serial Device converter
lsusb

# Connect
sudo tio /dev/ttyUSB1
# Or
sudo agetty -L 115200 ttyUSB linux
# Or
sudo agetty -L 9600 ttyUSB linux
```

