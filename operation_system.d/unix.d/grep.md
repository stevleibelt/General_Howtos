# grep

`grep [options] <pattern> <path or files>`

## grep inside a shell script

```bash
#example, do something if 'both modified' was found
if (git status | grep -q 'both modified')
then
    #...
fi

#or if you want to do things if 'both modified' was not found
if ! (git status | grep -q 'both modified')
then
    #...
fi
```

## Exit with code 0 if any match was found

```bash
grep -q
```

## Print all lines that are not matching

```bash
grep -v
```

## Print only but all matchings (even if they are on the same line)

* @see: https://unix.stackexchange.com/questions/6979/count-total-number-of-occurrences-using-grep

```bash
#you can copy past/run the following example
#creating the file
cat > foo.xml <<DELIM
<xml>
    <job>
    </job>
    <job></job><job></job>
</xml>
DELIM
#doing the test
cat foo.xml | grep -o '<job>' | wc -l
#the result is >>3<<
#and removing the file
rm foo.xml
```

## Print line numbers

´´´
grep -n
´´´

## Print only line numbers

´´´
grep -n | cut -f1 -d:
´´´

## Print only filenames

´´´
grep -l
´´´

## Print count of matching lines

´´´
grep -c
´´´

## Print non printable characters

```bash
grep '[^[:print:]]'
```

## Grep caseinsensitive

´´´
grep -i
´´´

## Search recursively

´´´
grep -r 'pattern' *
´´´

## Pattern has a leading "-"

´´´
grep -e '-pattern-' *
´´´

## Search for a whole word, not a part

´´´
grep -w 'word' *
´´´

## Search for words starting with 

´´´
grep  '\<hello' *
´´´

## Search for words ending with 

´´´
grep  'hello\>' *
´´´

## Do not search in binary files

```bash
grep -I '<pattern>' '<path>'
```

## Exlude directory

```bash
grep --exclude-dir=<path> '<pattern>' '<path>'
#exclude multiple dirs
grep --exclude-dir={<path>,<path>} '<pattern>' '<path>'
```

## And

```bash
#with -E
grep 'foo.*bar'
#with |
grep -E 'foo' | grep -E 'bar'
```

## Or

```bash
#with \|
grep 'foo\|bar'
#with -E
grep -E 'foo|bar'
#with -e
grep -e 'foo' -e 'bar'
#with egrep
egrep 'foo|bar'
```

## Not

```bash
#with -v
grep -v 'foo'
```

## Do an or

´´´
# find lines that contain 'paul' or 'frank'
grep 'paul|frank' *
´´´

## Do an and

´´´
# find lines that contain 'paul' and 'frank'
grep 'paul' * | grep 'frank'
´´´

## Include

´´´
# search "foo" in files named "bar.foo"
grep -r 'foo' --include="bar.foo" *
´´´

## Character classes

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

## Output <number of> lines before match

´´´
grep -B<number> 'pattern'
´´´

## Output <number of> lines after match

´´´
grep -A<number> 'pattern'
´´´

## Output <number of> lines around match

´´´
grep -C<number> 'pattern'
´´´

## Suppress errors

´´´
grep -s <pattern>
#or
grep <pattern> 2>/dev/null
´´´

## Links

* http://www.commandlinefu.com/commands/view/2998/grep-certain-file-types-recursively
* http://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples/
* http://www.thegeekstuff.com/2011/10/grep-or-and-not-operators/
* http://www.gnu.org/software/grep/manual/html_node/Usage.html#Usage
* http://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html#Character-Classes-and-Bracket-Expressions
* https://www.gnu.org/software/findutils/manual/html_node/find_html/grep-regular-expression-syntax.html
* http://www.robelle.com/smugbook/regexpr.html
* http://www.shellhacks.com/en/Using-BASH-Grep-OR-Grep-AND-Grep-NOT-Operators
* https://www.cyberciti.biz/faq/grep-regular-expressions/
