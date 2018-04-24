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
