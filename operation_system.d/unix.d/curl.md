# Curl

## Measure total response time

```bash
# ref: https://stackoverflow.com/a/28692873
curl -o /dev/null -s -w 'Establish Connection: %{time_connect}s\nTTFB: %{time_starttransfer}s\nTotal: %{time_total}s\n'  https://www.bazzline.net
```

## Display certificate information

```bash
# ref: https://stackoverflow.com/a/34812039
# Useful if you want to check the `expire date`
curl -vvI https://www.bazzline.net 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }'
```

## Check for specific tls version

```bash
# This also shows the ssl certificate infromation
curl --verbose --tlsv1.1 --tls-max 1.1 -I https://www.bazzline.net
```

## Define download path

```bash
curl --create-dirs --output my/wonderful/path/vmlinuz.EFI -LJO https://get.zfsbootmenu.org/efi
```

## Check result page contains expected words


```bash
curl -sS "<string: url>" | grep -i <string: expected word>
```

## Use resolve

```bash
# @see: https://utcc.utoronto.ca/~cks/space/blog/web/CurlTestingAlternateServer
# @since: 20221122

#if you need to test production settings on an testingserver
curl [-L] --resolve example.org:443:<string: ip_of_the_server> https://www.example.org

#more powerfull which helps to test backends without using the proxy
# @see: https://daniel.haxx.se/blog/2018/04/05/curl-another-host/
curl [-L] --connect-to :443:<string: test server url like test.internal> http://www.example.org
```

## Use a proxy

```bash
curl --proxy "http://<ip>[:<port>]" "https://foo.bar"

#a proxy but with a no_proxy definition
curl --proxy "http://<ip>[:<port>]" --noproxy "localhost,127.0.0,foo.bar" "https://baz.foo.bar"
```

## Add proxy

```bash
#best is to do this in the .bashrc or initial shell setup
export http_proxy=http://<ip>[:<port>]
export https_proxy=http://<ip>[:<port>]
```

## Add a cacert

```bash
cd /etc/ssl/certs
wget http://curl.haxx.se/ca/cacert.pem
```

## Force usage of ssl version 3

```bash
curl -3 https://foo.bar
```

## Follow insecure ssl

```bash
curl [-k|--insecure] <url>
```

## Add http status code output to response

```bash
#http://superuser.com/questions/272265/getting-curl-to-output-http-status-code
curl -i <url>
#or if you want to just have the http status code
curl -sw '\nhttp status code: %{http_code}' <url>
```

## Links

* http://curl.haxx.se/docs/httpscripting.html
* [Use the internet from the command line with curl](https://opensource.com/article/20/5/curl-cheat-sheet) - 2020-05-22
