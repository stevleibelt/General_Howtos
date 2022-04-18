# sed

```
#sed in place
sed -i 's/something\ i\ want\ to\ replace/my\ new\ data/g' path/to/the.file

#delete lines starting with
sed '/^foo/d' path/to/the.file

#delete empty lines
sed '/^$/d' path/to/the.file
```
