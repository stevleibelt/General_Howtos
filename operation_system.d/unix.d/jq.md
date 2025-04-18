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

### Dump result to string -> use join

```bash
cat my_json | jq -r '[.foo, .bar.baz] | join(" | ")'
```

### Select or

```bash
#filter out null
jq 'select((.my_key != "foo") and (.my_key != "bar"))'

#search for like
jq 'with_entries(select(.key(contains("<string: string>"))))'
```

### Format strings and escaping

```bash
#@tsv just puts a tab between things
jq -r '.[] | [.value[1], .metric.ruser, .metric.rhost] | @tsv'
```

### Playing with dates

```bash
# Assuming you have a json file containing rows with a date entry like
# {Date: "06 Oct 1983 08:20:32"}

# strptime is parsing the existing date format (string) to a datetime object
# strftime is parsing from the datetime object to a string
cat my.json | jq -c -r '.Date[5:25] | strptime("%d %b %Y %H:%M:%S") | strftime("%Y-%m-%d")'
```

## Links

* [An introduction to JQ: earthly.dev](https://earthly.dev/blog/jq-select/) - 20231220
* [Official page: stedolan.github.io](https://stedolan.github.io/jq/) - 20230213
* [JQ cheat sheet: lzone.de](https://lzone.de/cheat-sheet/jq) - 20230213
* [JQ / Playground: port.io](https://jq.port.io/) - 20250409
* [JQ select explained: eartly.dev](https://earthly.dev/blog/jq-select/) - 20230213
* [Some notes (to myself) about formatting text in jq: utcc.utoronto.ca](https://utcc.utoronto.ca/~cks/space/blog/sysadmin/JqFormattingTextNotes) - 20230315

