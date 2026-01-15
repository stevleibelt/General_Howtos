# TTY

## TTYUSB and serial console

```bash
# List available options
stty --help

# List detected serial ports
dmesg | grep -i ttys

# As example connecting to a opnsense
screen /dev/ttyUSB0 115200

# or if you have minicom installed
sudo minicom -b 115200 -D /dev/ttyUSB0

# If you run into issue like >>terminating screen<<
# Check permission by `ls -l /dev/ttyUSB0`
# ref: https://wiki.archlinux.org/title/Home_Assistant
# Check which exists on your system: `grep 'dialout\|uucp' /etc/group`
sudo usermod -a -G dialout $USER
# or
sudo usermod -a -G uucp $USER
```
