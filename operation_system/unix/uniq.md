# Uniq

Helps to remove duplicate content.

## Improve uniq result

```bash
#By using sort first, the chance is higher that uniq finds all duplicate entries
cat <string: filename> | sort | uniq
```

## Display duplicate content

```bash
# c - count number of duplicate entries
# d - displays entries with more than 1 count
cat <string: filename> | uniq -cd
```
