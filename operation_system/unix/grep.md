# general

grep [options] <pattern> <path or files>

# exit with code 0 if any match was found

```
grep -q
```

# print all lines that are not matching

´´´
grep -v
´´´

# print line numbers

´´´
grep -n
´´´

# print only line numbers

´´´
grep -n | cut -f1 -d:
´´´

# print only filenames

´´´
grep -l
´´´

# print count of matching lines

´´´
grep -c
´´´

# print non printable characters

```
grep '[^[:print:]]'
```

# grep caseinsensitive

´´´
grep -i
´´´

# search recursively

´´´
grep -r 'pattern' *
´´´

# pattern has a leading "-"

´´´
grep -e '-pattern-' *
´´´

# search for a whole word, not a part

´´´
grep -w 'word' *
´´´

# search for words starting with 

´´´
grep  '\<hello' *
´´´

# search for words ending with 

´´´
grep  'hello\>' *
´´´
# and

```
#with -E
grep 'foo.*bar'
#with |
grep -E 'foo' | grep -E 'bar'
```

# or

```
#with \|
grep 'foo\|bar'
#with -E
grep -E 'foo|bar'
#with -e
grep -e 'foo' -e 'bar'
#with egrep
egrep 'foo|bar'
```

# not

```
#with -v
grep -v 'foo'
```

# do an or

´´´
# find lines that contain 'paul' or 'frank'
grep 'paul|frank' *
´´´

# do an and

´´´
# find lines that contain 'paul' and 'frank'
grep 'paul' * | grep 'frank'
´´´

# include

´´´
# search "foo" in files named "bar.foo"
grep -r 'foo' --include="bar.foo" *
´´´

# character classes

* [:blank:]     - space and tab
* [:cntrl:]     - ASCI control characters (000, 037 ...)
* [:digit:]     - 0-9
* [:lower:]     - a-z
* [:upper:]     - A-Z
* [:space:]     - space, tab, new line, vertical tab, form feed, carriage return
* [:xdigit:]    - 0-9a-f
* [:alpha:]     - [:lower:] and [:upper]
* [:alnum:]     - [:alpha:] and [:digit:]
* [:graph:]     - [:alnum:] and [:punct:]
* [:print:]     - [:graph:] and [:blank:]

# http://www.thegeekstuff.com/2011/10/grep-or-and-not-operators/
# or

´´´
grep 'pattern1\|pattern2'
´´´

# and
#  there is no real and so we have to use grep in extended mode
# instead of grep -e you can also use egrep

´´´
grep -e 'pattern1.\*pattern2'
´´´

# output <number of> lines before match

´´´
grep -B<number> 'pattern'
´´´

# output <number of> lines after match

´´´
grep -A<number> 'pattern'
´´´

# output <number of> lines around match

´´´
grep -C<number> 'pattern'
´´´

# suppress errors

´´´
grep -s <pattern>
#or
grep <pattern> 2>/dev/null
´´´

# links

* http://www.commandlinefu.com/commands/view/2998/grep-certain-file-types-recursively
* http://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples/
* http://www.thegeekstuff.com/2011/10/grep-or-and-not-operators/
* http://www.gnu.org/software/grep/manual/html_node/Usage.html#Usage
* http://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html#Character-Classes-and-Bracket-Expressions
* https://www.gnu.org/software/findutils/manual/html_node/find_html/grep-regular-expression-syntax.html
* http://www.robelle.com/smugbook/regexpr.html
* http://www.shellhacks.com/en/Using-BASH-Grep-OR-Grep-AND-Grep-NOT-Operators
