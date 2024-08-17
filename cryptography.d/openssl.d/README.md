# OpenSSL

## Examples

### View content of certificate from file

```bash
# view content of certificate
openssl x509 -noout -text -in <string: file_path>
```

### View content of certificate from server

```bash
openssl s_client -connect "<string: hostname_or_ip>:443" -showcerts
# add more verbosity
openssl s_client -connect "<string: hostname_or_ip>:443" -showcerts -msg
# maybe a starttls protocol is required
# man openssl-s_client
openssl s_client -starttls postgres -connect "<string: hostname_or_ip>:<port>" -showcerts
```

## Links

* [arch linux wiki](https://wiki.archlinux.org/title/OpenSSL) - 20230310

