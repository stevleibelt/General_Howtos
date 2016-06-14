# examples

## begin fo the line

```
grep "^Begin" <file>
```

## end fo the line

```
grep "end$" <file>
```

## count number of empty lines

```
#-c - count
grep -c "^$" <file>
```

## single character

```
#find anything fitting like:
#hello
#cello
grep ".ello" <file>
```

## search a word with four characters

```
grep -w "...." <file>
```

## zero or more characters

```
grep "*." <file>
```

## one or more characters

```
grep "\+" <file>
```

## zero or one character

```
grep "\?" <file>
```

## escaping special character

```
#search for "."
grep "\." <file>
```

## character class

```
#search for all numbers
grep "[0-9]" <file>
```

## exclude characters

```
#search for all not containing abc
grep "^[abc]" <file>
```

# links

* https://regex101.com/
* http://www.regexr.com/
* https://en.wikipedia.org/wiki/Regular_expression
* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions
* http://www.autohotkey.com/docs/misc/RegEx-QuickRef.htm
* http://www.alertsite.com/help/RegexMatching.html
* http://www.regular-expressions.info/tutorial.html
* http://www.thegeekstuff.com/2011/01/regular-expressions-in-grep-command/
