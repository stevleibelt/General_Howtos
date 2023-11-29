# general

    printf <string> <argument_one> [<argument_two> [... [<argument_n>]]]
    printf 'my %s content' 'super'

# patterns

* %c    -   one char
* %s    -   string
* %b    -   like %s but interpret \n or \v also
* %d    -   integer including sign (+/-)
* %i    -   same like %d
* %u    -   positiv integer (-2 becomes 18446744073709551614 on a 64 bit cpu)
* %f    -   float
* %e    -   float in exponential notation
* %E    -   same as %e
* %x    -   integer in hex notation (lower case chars)
* %X    -   like %x but with uppercase chars
* %g    -   if exponent below -4, %e is used, otherwise %f
* %G    -   if exponent below -4, %E is used, otherwise %f
* %%    -   returns simple %%
* \\    -   backspace
* \a    -   alert (acoustic/bell)
* \b    -   backspace
* \c    -   no further output (equals n)
* \e    -   escape
* \f    -   form feed
* \n    -   new line (jump to beginning of new line)
* \r    -   carriage return (jump to beginning of current line)
* \t    -   horizontal tab
* \v    -   vertical tab

## information about wide of output

* -         -   output is left-justified
* integer   -   minimal width
* .         -   cut off accuracy :ta
