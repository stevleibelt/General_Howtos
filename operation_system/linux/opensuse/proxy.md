# Enable system wide proxy support

```
#vim /etc/sysconfig/proxy
PROXY_ENABLED="yes"
HTTP_PROXY="http://<proxy ip>:<proxy port>"
HTTPS_PROXY="http://<proxy ip>:<proxy port>"
FTP_PROXY="http://<proxy ip>:<proxy port>"
NO_PROXY="localhost, 127.0.0.1, *.my.domain, <my network ip part like 172.16.*>"
```
