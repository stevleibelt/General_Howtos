# print all lines that are not matching

    grep -v

# print linenumbers

    grep -n

# print only filenames

    grep -l

# print count of matching lines

    grep -c

# grep caseinsensitive

    grep -i

# search recursively

    grep -r 'pattern' *

# pattern has a leading "-"

    grep -e '-pattern-' *

# search for a whole word, not a part

    grep -w 'word' *

# search for words starting with 

    grep  '\<hello' *

# search for words ending with 

    grep  'hello\>' *

# do an or

    # find lines that contain 'paul' or 'frank'
    grep 'paul|frank' *

# do an and

    # find lines that contain 'paul' and 'frank'
    grep 'paul' * | grep 'frank'

# include

    # search "foo" in files named "bar.foo"
    grep -r 'foo' --include="bar.foo" *

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

    grep 'pattern1\|pattern2'

# and
#  there is no real and so we have to use grep in extended mode
# instead of grep -e you can also use egrep

    grep -e 'pattern1.*pattern2'

# output <number of> lines before match

    grep -B<number> 'pattern'

# output <number of> lines after match

    grep -A<number> 'pattern'

# output <number of> lines around match

    grep -C<number> 'pattern'

# links

* http://www.commandlinefu.com/commands/view/2998/grep-certain-file-types-recursively
* http://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples/
* http://www.gnu.org/software/grep/manual/html_node/Usage.html#Usage
* http://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html#Character-Classes-and-Bracket-Expressions
* https://www.gnu.org/software/findutils/manual/html_node/find_html/grep-regular-expression-syntax.html
* http://www.robelle.com/smugbook/regexpr.html
