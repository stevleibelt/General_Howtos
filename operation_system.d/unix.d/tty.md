# TTY

## TTYUSB and serial console

```bash
# As example connecting to a opnsense
screen /dev/ttyUSB0 115200
# or if you have minicom installed
sudo minicom -b 115200 -D /dev/ttyUSB0
```
