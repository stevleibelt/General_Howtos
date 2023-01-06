# git diff

## Changes from one commit id

```bash
git diff <commit_id>^!
#or
git show <commit_id>
```

## Between tags

```bash
git diff tag1..tag2
```

## Only file names

```bash
git diff tag1..tag2 --name-only

```

## Get file names and statistics

```bash
git diff tag1..tag2 --stat
```

## Get changes for one file

```bash
git diff tag1..tag2 -- path/to/file/name
```

## Between local and origin

```bash
#also good if you have staged changes already
git diff origin/master
```

## Between dates

```bash
#since yesterday
git diff "@{yesterday}"

#since two weeks ago
git whatchanged --since="2 weeks ago"
```

## Between versions

```bash
#based on the pre-pre-previous master commit
git diff [git hash] "master~3"
```

## Create a patch with newly added files

```bash
#you have to add all files you want to have in the patch
#git add <path to your files>
git diff --staged > your.patch
```

## Links

* http://stackoverflow.com/questions/3211809/git-diff-between-given-two-tags

