# lspci

```
#should be executed as root
#basic usage
#   if you want to know more, add -v, -vv or -vvv
sudo lspci

#searching with grep
sudo lspci | grep -e VGA

#searchung by using vendor device id
#   nvidia has 10de:
#   -d - displays all devices for this vendor device id
#   -nn - displays vendor and device id numbers
sudo lspci -nn -d 10de:

#output kernel modules by using -k
sudo lspci -nn -k -d 10de:

#update id database
sudo lspci -Q
#_or
sudo update-pciids
```

# Links

* [Use lspci on Linux to see your hardware](https://opensource.com/article/21/9/lspci-linux-hardware) - 20210907
