# Configure a proxy in your linux

This is the general section how to configure a proxy in your linux.

## Define the used variables everywhere

We are going to define the variables in a central place that is loaded in each user environment.

```bash
MY_PROXY='http://10.0.80.1:9010'

cat > /etc/profile.d/proxy.sh <<DELIM
export http_proxy="${MY_PROXY}"
export https_proxy="${MY_PROXY}"
export ftp_proxy="${MY_PROXY}"
export no_proxy="127.0.0.1,localhost"

export HTTP_PROXY="${MY_PROXY}"
export HTTPS_PROXY="${MY_PROXY}"
export FTP_PROXY="${MY_PROXY}"
export NO_PROXY="127.0.0.1,localhost"
DELIM

chmod +x /etc/profile.d/proxy.sh

#check that all is working from your current session
source /etc/profile.d/proxy.sh

env | grep -i proxy
```

Distribution specific tasks are listed below:

* [arch](distribution/arch/installation/proxy.md#set-a-proxy-so-your-pacman-will-work)
* [debian](distribution/debian/network.md#setup-proxy)

## Traps and possible problems for no_proxy

### windows uses ; while linux uses ,

First of all, your definition differs between windows and linux.

While windows uses the `;`, linux uses the `,` to define multiple no proxy areas.

```bash
#this definition works for windows
"localhost;127.0.0.1;foobar.local"

#this definition works for linux
"localhost,127.0.0.1,foobar.local"
```

### Sub domains

While windows needs an asterix `*.` with a dot to define a sub domain wildcard, linux does not need it AND can not deal with it.

```bash
#this definition works for windows
"localhost;127.0.0.1;foobar.local;*.bar.foo.ru"

#this definition works for linux
"localhost,127.0.0.1,foobar.local,bar.foo.ru"
```

### IP Ranges

While windows supports the asterix as wildcard, linux simple can not do it. This leads to the fact, that linux can not handle wildcards in ip ranges.

Or written in an other way, you have to add each ip address in the no proxy section in linux.

Linux can also not handle something line `172.16.0.0/24`.

**DANGER** - you can not add to much ip's our you will get a `Argument list too long` error because EACH user (also root!) will source this file and will run out of memory.

```bash
#this definition works for windows
"localhost;127.0.0.1;foobar.local;*.bar.foo.ru;172.16.*"

#this definition works for linux
#to get the same result as with windows, you need to add EACH ip address in the 172.16.0.0/24 network!
"localhost,127.0.0.1,foobar.local,bar.foo.ru,172.16.1.1,172.16.1.2"

#a solution to make it maintainable is
export no_proxy="localhost,127.0.0.1,foobar.local,bar.foo.ru",$(echo 172.16.{1..255}.{1..255} | sed 's/ /,/g')
##or
no_proxy="localhost,127.0.0.1,foobar.local,bar.foo.ru",
printf -v no_proxy '%s,' 172.16.{1..255}.{1..255};
export no_proxy="${no_proxy%,}";
```

