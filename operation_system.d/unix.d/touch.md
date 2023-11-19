# create file with a special creation date

```
# create a file with a the creation date of 1983-10-06 and a creation time of 13:37
touch -d "1983-10-06 13:37" <my file>

# or
touch -t [[CC]YY]MMDDhhmm[.ss] <my file>
```

# change file access and modification time only

```
#change access and modification time
touch -a <my file>

#change modification time only
touch -m <my file>

#set explicit access and modification time
change -c -t [[CC]YY]MMddhhmm[.ss]

#use timestamp of another file
touch -r <my file> <other file>
```

# links

* http://www.computerhope.com/unix/utouch.htm
