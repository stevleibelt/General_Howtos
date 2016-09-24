# between tags

```
git diff tag1..tag2
```

# only file names

```
git diff tag1..tag2 --name-only

```

# get file names and statistics

```
git diff tag1..tag2 --stat
```

# get changes for one file

```
git diff tag1..tag2 -- path/to/file/name
```

# between local and origin

```
#also good if you have staged changes already
git diff origin/master
```

# links

* http://stackoverflow.com/questions/3211809/git-diff-between-given-two-tags
