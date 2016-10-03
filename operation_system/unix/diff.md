# compare directories

```
#-b - ignore changes in the amount of white space
#-u - output lines of unified context (default is 3)
#-r - recursive compare any subdirectories found
#-q - report only when files differ
#--no-dereference - ignore links
diff -burq <path to first directory> <path to second directory> | sort
```

# tools

* [bdelta](https://github.com/jjwhitney/BDelta)
* [jojodiff](http://jojodiff.sourceforge.net/)
* [courgette](https://www.chromium.org/developers/design-documents/software-updates-courgette)
* [xdelta](http://xdelta.org/)
* [bsdiff](http://www.daemonology.net/bsdiff/)
* [jdiff](http://javadiff.sourceforge.net/)
