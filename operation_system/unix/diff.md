# diff

## Compare Directories

```
#-b - ignore changes in the amount of white space
#-u - output lines of unified context (default is 3)
#-r - recursive compare any subdirectories found
#-q - report only when files differ
#--no-dereference - ignore links
diff -burq <path to first directory> <path to second directory> | sort
```

## Links

* [bsdiff](http://www.daemonology.net/bsdiff/)
* [bdelta](https://github.com/jjwhitney/BDelta)
* [courgette](https://www.chromium.org/developers/design-documents/software-updates-courgette)
* [jdiff](http://javadiff.sourceforge.net/)
* [jojodiff](http://jojodiff.sourceforge.net/)
* [xdelta](http://xdelta.org/)
