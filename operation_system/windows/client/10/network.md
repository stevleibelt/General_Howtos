# General

```
#show help
netsh /?
```

# Proxy

```
#all have to be done in the cmd.exe environment

#Set system proxy
#This needs to be done especially for Windows 10 1809. You should not need to do it for later windows 10 versions
# if your have a good gpo
netsh winhttp set proxy "<proxy ip>[:<proxy port>]>" "localhost;127.0.0.1;*.your.domain;<your subnet ip.*>"

#show system proxy
netsh winhttp show proxy

#reset system proxy
netsh winhttp reset proxy
```

# Links

* [Netsh Command syntax, Contexts and Formatting - docs.microsoft.com](https://docs.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-contexts) - 2020-01-27
* [Netsh - wikipedia.org](https://en.wikipedia.org/wiki/Netsh) - 2020-01-27
