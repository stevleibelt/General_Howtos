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

# add http status code output to response

```
#http://superuser.com/questions/272265/getting-curl-to-output-http-status-code
curl -i <url>
#or if you want to just have the http status code
curl -sw '\nhttp status code: %{http_code}' <url>
```

# links

* http://curl.haxx.se/docs/httpscripting.html
