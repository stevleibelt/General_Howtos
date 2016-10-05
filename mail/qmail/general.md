# .qmail file content options

```
#comment
| <command to execute if this mail is triggered>
& <email address to forward to> #if your mail address starts with [0-9]|[A-Z][a-z], you can ommit the "&"
[./]<path> #deliver to local mail box file
[./]<path>/ #deliver local maildir
```

# catch all .qmail file

```
touch .qmail-default
cat > .qmail-default <DELIM
<your email address>
DELIM
```

# links

* https://wiki.uberspace.de/mail:dotqmail
