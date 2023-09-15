# replace file extension

```bash
LOCAL_FILE_NAME="foo.bar"

#prints out "foo.baz"
echo "${LOCAL_FILE_NAME%.bar}.baz"
```

# replace

```
#shortest substring match
#remove smallest fitting peace from the right
${VARIABLE%pattern}

#remove smallest fitting peace from the left
${VARIABLE#pattern}

#longest substring match
#remove biggest fitting peace from the right
${VARIABLE%%pattern}

#remove biggest fitting peace from the left
${VARIABLE##pattern}
```

# find and replace

```
#replace first match
${<VARIABLE>/<PATTERN>/<REPLACEMENT>}

#replace all maches
${<VARIABLE>//<PATTERN>/<REPLACEMENT>}

#replace when it begins with
${<VARIABLE>/#<PATTERN>/<REPLACEMENT>}

#replace when it ends with
${<VARIABLE>/%<PATTERN>/<REPLACEMENT>}
```

# length

```
LENGTH=${#VARIABLE}
```

# substring

```
STRING="there is no foo without a bar"
#${<VARIABLE>:<POSITON>[:<LENGTH>]}

#outputs "foo"
echo ${STRING:12:3}
```

# links

* http://www.thegeekstuff.com/2010/07/bash-string-manipulation
