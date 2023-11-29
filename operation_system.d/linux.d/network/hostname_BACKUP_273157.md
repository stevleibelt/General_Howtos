# hostname

```
#get
cat /etc/hostname
##or
hostnamectl status

#set - think about updating /etc/hosts
echo "<your hostname>" > /etc/hostname
##or
hostnamectl set-hostname "<your hostname>"
```

# links

* [change hostname on debian](https://wiki.debian.org/HowTo/ChangeHostname)
