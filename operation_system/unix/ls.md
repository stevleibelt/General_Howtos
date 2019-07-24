# example

## enumerate files

```
#works everywhere
for FILE_NAME in *;
do
    [[ -e ${FILE_NAME} ]] || continue
    echo ${FILE_NAME}
done

#works only in bash
shopt -s nullglob
for FILE_NAME in *;
do
    echo ${FILE_NAME}
done
```

# links

* [don't parse output of ls](http://mywiki.wooledge.org/ParsingLs)
* [Master the Linux 'ls' command](https://opensource.com/article/19/7/master-ls-command) - 2019-07-24
