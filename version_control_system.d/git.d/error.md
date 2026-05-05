# error handling

## git gc error: Could not read

[source](https://stackoverflow.com/a/46604551)

```
mv .git .git_YYYYMMDD
git init
cp .git_YYYYMMDD/config .git/config
git fetch
git reset origin/master --mixed
#optional tasks needs to be done dependend on the output of
git status
```
