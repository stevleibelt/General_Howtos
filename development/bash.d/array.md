# create

```
MY_ARRAY=("first element" "second element")
MY_ARRAY_WITH_ONE_VALUE[0]="value"
MY_OTHER_ARRAY=( [0]="first element" [1]="second element")
```

# adapt

```
MY_ARRAY_WITH_ONE_VALUE+=("another value")
```

# delete

```
unset MY_ARRAY
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
${ARRAY[*]} or ${ARRAY[@]} - all elements done by globbing or word-splitting
"${ARRAY[*]}" - no glubbing, elements separated by first character out of $IFS, at the and the whole content is one argument
"${ARRAY[@]}" - no globbing, each elemen is an own argument

for ELEMENT in "${MY_ARRAY[@]}";
do
    echo 'element: '$ELEMENT
done
```

# sort

```
#@see: https://stackoverflow.com/a/11789688
IFS=$'\n' SORTED_ARRAY=($(sort <<<"${ARRAY[*]}"))
unset IFS
```

# links

* http://www.cyberciti.biz/faq/bash-for-loop/
* http://www.thegeekstuff.com/2011/07/bash-for-loop-examples/
