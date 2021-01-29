# Set a proxy so your pacman will work

Export the following variables right when you are logged in after the image boot process.

```
export http_proxy='http://10.0.1.1:8080'
export https_proxy='http://10.0.1.1:8080'
export ftp_proxy='http://10.0.1.1:8080'
export no_proxy='127.0.0.1,localhost,172.16.*,mylocaldomain.local
```

# Link

* [How to use Arch Linux pacman through a proxy](https://www.garron.me/en/go2linux/arch-linux-pacman-proxy.html) - 20090507
