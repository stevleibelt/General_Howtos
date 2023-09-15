# [] vs [[]]

```
Contrary to [, [[ prevents word splitting of variable values. So, if VAR="var with spaces", you do not need to double quote $VAR in a test - eventhough using quotes remains a good habit. Also, [[ prevents pathname expansion, so literal strings with wildcards do not try to expand to filenames. Using [[, == and != interpret strings to the right as shell glob patterns to be matched against the value to the left, for instance: [[ "value" == val* ]].
```

[source](http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_02.html)

# test

* write a test in braces [ test ]
* -d            -   is directory
* -f            -   is file
* -r            -   is file and do we have read permission
* -w            -   is file and do we have write permission
* -x            -   is file and do we have execute permission
* -z            -   has string length of null/zero (hint: convert all variables to string by wrapping them with "$FOO" to check if variable is set)
* -n            -   has string length of not null
* $foo = $bar   -   true if $foo and $bar having same string content
* $foo -eq $bar -   true if $foo and $bar having same arithmetical content ([ "1" -eq "0001" ] is true)
* $foo -ne $bar -   true if $foo and $bar are not equal
* $foo -lt $bar -   true if $foo is less then $bar
* $foo -le $bar -   true if $foo is less then or equal $bar
* $foo -gt $bar -   true if $foo is greater then $bar
* $foo -ge $bar -   true if $foo is greater then or equal $bar
* ! $foo = $bar -   true if $foo and $bar are not having the same string content
* 1 -eq 1 -a 2 -gt 1    -   test one and test two are true (true when [ 1 -eq 1 ] is true and [ 2 -gt 1 ] is true)
* 1 -eq 1 -o 2 -gt 1    -   test one or test two is true (true when [ 1 -eq 1 ] is true or [ 2 -gt 1 ] is true)
* man test if you want to know more

# if query

if <test_one>: then <order_one>;
[ elif <test_two>; then <order_two>; ]
[ else <order_three>; ]
fi

# case query

case <expression> in
    <assumption_one>) <order_one>
        ;;
    [<assumption_two>) <order_two>
        ;;]
    [...]
    [<assumption_n>) <order_n>
        ;;]
    [*) # default/fallback
        ;;]
esac

# while loop

while <order_one> : do
        <order_two> 
        [<order_three>]
        [...]
        [<order_n>]
done

# until loop

until <order_one>; do
        <order_two> 
        [<order_three>]
        [...]
        [<order_n>]
done

# for loop

for <variable_one> in <list> ; do
        <order_two> 
        [<order_three>]
        [...]
        [<order_n>]
done

# break and continue

'break' [level] stops the loop completely. level default is 1.
'continue' [level] stops iteration for current element (continues with next). level default is 1.
