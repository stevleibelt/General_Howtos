# create

```
MY_ARRAY=('first element' 'second element')
MY_OTHER_ARRAY=( [0]='first element' [1]='second element')
```

# size/length

```
LENGTH=$($MY_ARRAY[@])
LENGTH=$($MY_OTHER_ARRAY[*])
```

# print array

```
echo "${MY_ARRAY[@]}"
printf "%s\n" "${MY_OTHER_ARRAY[@]}"
```

# iterate

```
for ELEMENT in "${MY_ARRAY[@]}"
do
    :
    echo 'element: '$ELEMENT
done
```

# links

* http://www.cyberciti.biz/faq/bash-for-loop/
* http://www.thegeekstuff.com/2011/07/bash-for-loop-examples/
