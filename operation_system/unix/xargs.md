# force xargs to use at most 2 arguments per command line

```
echo 1 2 3 4 | xargs -n 2
```

# deal with white spaces

```
# use "null separator"
xargs -0
```

# buffer each line from the input internally

```
xargs -I
```

# use argument list

```
#{} is the default list marker
#{} can be overwritten/defined by what ever you want
find . -name "*.md" | xargs -0 -I {} echo {}
#is the same as
find . -name "*.md" | xargs -0 -I filename echo filename
```

# links

* http://www.cyberciti.biz/faq/linux-unix-bsd-xargs-construct-argument-lists-utility/
* http://www.linuxplanet.com/linuxplanet/tutorials/6522/1/
* https://en.wikipedia.org/wiki/Xargs
* http://javarevisited.blogspot.de/2012/06/10-xargs-command-example-in-linux-unix.html
