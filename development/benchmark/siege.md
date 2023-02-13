# Siege

## Example

```bash
# -t = lifetime
# -c = number of concurrent users
# -d = highest possible and randomized delay between users
# -i = flag to use "internet mode" to randomly select urls to hit
# -f = files containing urls, use $SIEGE_HOME/etc/urls.txt as reference
siege -t 1m -c 25 -d10 -i -f url.txt 
```

## Links

* https://www.joedog.org/siege-home/

