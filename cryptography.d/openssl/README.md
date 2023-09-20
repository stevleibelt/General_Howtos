# OpenSSL

## Examples

### View content of certificate from file

```bash
# view content of certificate
openssl x509 -noout -text -in <string: file_path>
```

### View content of certificate from server

```bash
openssl s_client -connect "<string: hostname_or_ip>:443"
```


## Links

* [arch linux wiki](https://wiki.archlinux.org/title/OpenSSL) - 20230310

