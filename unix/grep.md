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

* http://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples/
