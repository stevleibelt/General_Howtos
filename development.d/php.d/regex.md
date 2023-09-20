# Regular Expressions

## Delimiert

```
#choose the right delimiert
#general, the default delimiter `/` is perfect, except you have to deal with things linke uri's
#_not so readable
preg_match('/^https:\/\/example.com\/path/i', $uri);
#_more readable
preg_match('#^https://example.com/path#i', $uri);
```

## Only use escape `\` when really needed

```
#_not so readable
preg_match('/Price: [0-9\-\$\.\+]+/')
#_more readable
preg_match('/Price: [0-9$.+-]+/')
```

## Non-capture groups

`(?:f|b)` is a group but a non capture group because of the `?:`.
`$matches` is not filled up with data you don't need.

```
#_non needed content inside
preg_match('/Price: (£|€)(\d+)/', 'Price: €24', $matches)
#_only needed content inside
preg_match('/Price: (?:£|€)(\d+)/', 'Price: €24', $matches)
```

## Named captures

Named capture groups results in strings in the `$matches` array.

```
#_not so readable
preg_match('/Price: (?<currency>£|€)(\<price>d+)/', 'Price: €24', $matches)
#_more readable
```

## Comments and multiline

```
#_not so readable
$pattern  = '/Price: (?<currency>£|€)(?<price>\d+)/i';
#_more readable
$pattern = <<<PATTERN
  /Price:           # Check for the label "Price:"
  \s                # Ensure a white-space after.
  (?<currency>£|€)  # Capture currency symbols £ or €
  (?<price>\d+)     # Capture price without decimals.
  /ix               # Flags: Case-insensitive
PATTERN;
```

## Only use escape `\` when really needed

```
#_not so readable
#_more readable
```

## Only use escape `\` when really needed

```
#_not so readable
#_more readable
```

## Only use escape `\` when really needed

```
#_not so readable
#_more readable
```

## Only use escape `\` when really needed

```
#_not so readable
#_more readable
```
# Link

* [Writing better Regular Expressions in PHP](https://php.watch/articles/php-regex-readability) - 20210527
