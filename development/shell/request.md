# test

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
