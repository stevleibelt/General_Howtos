# cat multiple files found by find

```
#assuming you want to grep for <foo> after cat-ing all files
#@see: http://stackoverflow.com/questions/864316/how-to-pipe-list-of-files-returned-by-find-command-to-cat-to-view-all-the-files
cat `find <path> -name <name>` | grep <foo>
```

# write multiple line content into a file

```
cat > <path to the file> <<DELIM
this
is
a
multiple
line
content
DELIM
```
