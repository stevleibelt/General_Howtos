# Swap

## Create swap file

```bash
# ref:
#   https://www.howtogeek.com/455981/how-to-create-a-swap-file-on-linux/
#   https://wiki.archlinux.org/title/Swap
#create 4 GB swap file
#   dd prevents error "has holes"
sudo dd if=/dev/zero of=/swapfile bs=1M count=4168 status=progress
sudo chmod 600 /swapfile.bin
sudo mkswap -U clear /swapfile.bin
sudo swapon /swapfile.bin
sudo bash -c echo "/swapfile.bin none    swap    defaults  0   0"
```

## Show available swap partitions

```bash
swapon -s
```
