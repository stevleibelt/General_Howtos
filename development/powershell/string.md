# PowerShell string handling

## Here or multiline strings

```pwsh
$Foo = @"
There is
no
foo
without a
bar
"@

$SqlStatement = @'
SELECT
    `foo`
FROM
    `bar`
'@
```

## Embedded quotes


```
"There is ""no"" foo without a bar"

'There is ''no'' foo without a bar'

'There is "no" foo without a bar'

"There is `"no`" foo without a bar"
```

## String interpolation

Only works with double quotes.

```pwsh
$bar = "foo"
$foo = "bar"

"There is no $bar without a $foo."
```

## Formatting

```pwsh
#strings
[string]::Format("There is no {0} without a {1}.", "foo", "bar")

"There is no {0} without a {1}. {0}{1}!" -f "foo", "bar"

#numbers
"N0 {0:N0} formatted." -f 610.1983

"N0 {0:N2} formatted." -f 610.1983

"N0 {0,3:N0} formatted." -f 610.1983

#currency

"C0 {0,20:C2} formatted." -f 12345678.7213

#percentage
"P0 {0,8:P2} formatted." -f 0.1234

#date
"This date is great! {0:yyyy-MM-dd HH:mm:ss}"
```

