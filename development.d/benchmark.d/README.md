# Benchmarking or Performance testing

## HTTP

Apache jmeter was the long time defacto standard.

### Examples

```bash
bombardier -c 400 -d 10s https://www.foo.bar

cassowary run -u https://www.foo.bar -c 12 -n 400

siege -t12 -c400 https://foo.bar

#-c: target number of connectsion
#-H: Start sending unfinished HTTP requests
#-g: Generate csv and html file when test has been finished
#-o: Specifies custom file name for -g
#-i: Intervall between follow up data
#-r: Connection rate
#-t: Type of test (GET/POST ...)
#-u: URL or ip
#-x: starts in slow read mode
#-p: Invervall to wait for HTTP Response
slowhttptest -c 400 -H -g -o ./slowhttptest_foo_bar.log -i 10 -r 200 -t GET -u https://www.foo.bar -x 24 -p 2

wrk -t12 -c400 -d30 https://www.foo.bar
```

# Links

* HTTP
  * [bombardier](https://github.com/codesenberg/bombardier) - 20230213
  * [cassowary](https://github.com/rogerwelin/cassowary) - 20230213
  * [drill](https://github.com/fcsonline/drill) - 20230213
  * [k6](https://github.com/grafana/k6?ref=thechiefio) - 20230213
  * [siege](https://github.com/JoeDog/siege) - 20230213
  * [SlowHTTPTest](https://github.com/shekyan/slowhttptest) - 20230213
  * [tsung](https://github.com/processone/tsung) - 20230213
  * [wrk](https://github.com/wg/wrk?ref=thechiefio) - 20230213

