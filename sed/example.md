# extract content from file

```
sed -n -e 's/^.*MyWord\ with\ whitespaces\ "\(.*\)"\ and\ more.*/\1/p' sourceFile > destinationFile
```
# extract single xml tag

```
# get all content between tag "mylink" from xml
sed -n -e 's/.*<mylink>\(.*\)<\/mylink>.*/\1/p' exampleXml > myfile
```

# matching end pattern

```
sed -n -e 's/^.*\/my\/endline\ pattern\(.*\)$/\1/p' < source.file | sort | uniq -c > destination.file. sort_and_uniq
```
