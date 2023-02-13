# JQ

## Examples

### Count number of entries per value

`jq '.my_key' | sort | uniq -c | sort`

### Sort keys by number of nested elements

```bash
# example
echo '{"user_a": [1,2,3], "user_b": [1,2], "user_c": [3,4,5,6,4,2]}' | jq -r 'keys[] as $key | "\(.[$key] | length), \($key)"' | sort

# results in
2, user_b
3, user_a
6, user_c
```

### Select or

```bash
#filter out null: >>!= null<<
jq 'select((.my_key != "foo") and (.my_key != "bar"))'
```

## Links

* [Official page](https://stedolan.github.io/jq/) - 20230213
* [JQ cheat sheet](https://lzone.de/cheat-sheet/jq) - 20230213
* [JQ select explained](https://earthly.dev/blog/jq-select/) - 20230213

