# extended backus naur form

* notation to express a context-free grammar


## example

```
lowercase alphabete = "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z"
number = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
valid character = lowercase alphabete | number
valid characters = {valid character}
```

## table of symboles

* =         - definition
* ,         - concatenation
* ;         - termination
* |         - alternation
* [...]     - optional
* {...}     - repetition
* (...)     - grouping
* "..."     - terminal string
* '...'     - terminal string
* (*...*)   - comment
* ?...?     - special sequence
* -         - exception

# links

* https://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_Form
