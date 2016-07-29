# replace file extension

```bash
LOCAL_FILE_NAME="foo.bar"

#prints out "foo.baz"
echo "${LOCAL_FILE_NAME%.bar}.baz"
```

# replace

```
#remove smallest fitting peace from the right
${VARIABLE%pattern}

#remove biggest fitting peace from the right
${VARIABLE%%pattern}

#remove smallest fitting peace from the left
${VARIABLE#pattern}

#remove biggest fitting peace from the left
${VARIABLE##pattern}
```
