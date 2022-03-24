# How To

## Use a proxy

```
curl --proxy "http://<ip>[:<port>]" "https://foo.bar"

#a proxy but with a no_proxy definition
curl --proxy "http://<ip>[:<port>]" --noproxy "localhost,127.0.0,foo.bar" "https://baz.foo.bar"
```

## Add proxy

```
#best is to do this in the .bashrc or initial shell setup
export http_proxy=http://<ip>[:<port>]
export https_proxy=http://<ip>[:<port>]
```

## Add a cacert

```
cd /etc/ssl/certs
wget http://curl.haxx.se/ca/cacert.pem
```

## Force usage of ssl version 3

```
curl -3 https://foo.bar
```

## Fllow insecure ssl

```
curl [-k|--insecure] <url>
```

## Add http status code output to response

```
#http://superuser.com/questions/272265/getting-curl-to-output-http-status-code
curl -i <url>
#or if you want to just have the http status code
curl -sw '\nhttp status code: %{http_code}' <url>
```

# Links

* http://curl.haxx.se/docs/httpscripting.html
* [Use the internet from the command line with curl](https://opensource.com/article/20/5/curl-cheat-sheet) - 2020-05-22
