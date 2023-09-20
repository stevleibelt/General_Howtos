# example

```
case ${VARIABLE} in
  foo)
    echo "variable contains >>foo<<"
    ;;
  "foo bar")
    echo "variable contains >>foo bar<<"
    ;;
   bar|baz)
     echo "variable contains either >>bar<< or >>baz<<"
     ;;
   *)
     echo "variable contains something else"
esac
```

# links

* http://www.shellhacks.com/en/CASE-Statement-in-Bash-Example
* https://bash.cyberciti.biz/guide/The_case_statement
* http://wiki.bash-hackers.org/syntax/ccmd/case
