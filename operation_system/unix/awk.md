# change default separator

```
#use ";" as separator instead of default " "
awk 'BEGIN { FS = ";" } ; { print $1 }'
```

# show lines longer than X characters

```
#show lines longer than 100 characters
awk 'length > 100'
```

# links

* http://www.grymoire.com/Unix/Awk.html
* http://www.staff.science.uu.nl/~oostr102/docs/nawk/nawk_23.html
* https://en.wikipedia.org/wiki/AWK
* https://ma.ttias.be/awk-trick-show-lines-longer-x-characters/
