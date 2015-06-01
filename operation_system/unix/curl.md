# Add a cacert

```
    cd /etc/ssl/certs
    wget http://curl.haxx.se/ca/cacert.pem
```

# force usage of ssl version 3

```
    curl -3 https://foo.bar
```

# allow insecure ssl

```
    curl [-k|--insecure] <url>
```

# links

* http://curl.haxx.se/docs/httpscripting.html
