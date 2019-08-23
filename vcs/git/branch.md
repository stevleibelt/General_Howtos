# branch

## compare local with remote

```
git diff <my branch> origin/<my branch>
```

## prevent tracking upstream branches

```
#instead of
git pull #what is git fetch + git rebase
#do
git pull --rebase #what is git fetch + git rebase
#http://stackoverflow.com/questions/16666089/whats-the-difference-between-git-merge-and-git-rebase/16666418#16666418
```

## list

```
git branch                      #list all local branches
git branch -r                   #list all remote branches - cached information
git remote show origin          #list all remote branches - realtime information
git ls-remote --heads origin    #list all remote branches - realtime information
git branch -a                   #list all local and remote branches - cached information
git branch --merged origin/master | grep -v 'master'    #list all local branches that are merged into the master already
```

## update remote branches

```
git remote prune origin
# same result
git fetch --prune
```

## create new local branch

```
git checkout -b my_branch
```

## create new local branch from tag

```
git checkout <your branch you want to branch from, e.g. master>
# assuming you want to create a branch from tag "1.0"
git checkout -b <branch name> <tag name>
```

## create new remote branch from existing local branch

```
git push origin <local branch name>:<remote branch name>
```

## create from remote branch / switch to remote branch

```
#update the remote-tracking branches
#@see https://www.kernel.org/pub/software/scm/git/docs/git-fetch.html
git fetch origin
#remove remote deleted branches
git remote prune origin 
#switch to branch
git checkout -b my_branch origin/my_branch
```

## delete local branch

```
#only deletes if local changes are fully merged into its upstream branch
git branch --delete <branch name>
#deletes branch without checking its status against the upstream branch
git branch --delete --force <branch name>
```

## switch to a local branch

```
git checkout <local branch name>
```

## switch to a tag of master

```
git checkout master
git pull
git checkout -b my_branch refs/tags/<tag name>
```

## remove local branch

```
git branch -d my_branch
```

## remove all local branches that are merged into the master already

```
git branch --merged origin/master | grep -v 'master' | xargs -n 1 git branch -d
```

## remove remote branch after local deletion

```
git push origin --delete my_branch
#or
git push origin :my_branch
```

## merge

### branch into master

```
git checkout master
git merge <branch name>
```

### master tag into branch

```
#git fetch --tags origin
git fetch origin
git merge <tag name>
#if you run into issues and simple do not want to solve the conflict
git merge --abort
#dry run

```

### resolve a conflict

To mark a conflict/file as resolved, simple add it to the staging with git add <directory or file name>.
For solving it in a visual way, try to use git mergetool (see section below).

### mergetool

#### general

```
#use a different merge tool
git mergetool -t gvimdiff
```

#### vimdiff

##### layout

+--------------------------------+
| LOCAL  |     BASE     | REMOTE |
+--------------------------------+
|             MERGED             |
+--------------------------------+

LOCAL:  A temporary file containing the contents of the file on the current branch.
BASE:   A temporary file containing the common base for the merge.
REMOTE: A temporary file containing the contents of the file to be merged.
MERGED: The file containing the conflict markers.

#### [meld](http://meldmerge.org/)

## rename

### renmame a not checked out branch

```
git branch -m <old name> <new name>
```

### rename current branch

```
git branch -m <new name>
```

### rename local and remote repository

```
#change name
git branch -m <old name> <new name>
#create new remote repository with new name
git push --set-upstream origin <new name>
#delete old remote repository
git push origin :<old name>
```

## remove a pushed and merged branch

[source](https://stackoverflow.com/a/50150652)

```
#this is dangerous
git checkout <branch>   #e.g. master
git log #find the commit id before you've merged the branch
git reset --hard <commit-id-before-the-merge>
git push -f origin <remote-branch>
#maybe needed
git push --f origin HEAD:<remove-branch>
```

# links

* [rebase, reset and revert.](https://opensource.com/article/18/6/git-reset-revert-rebase-commands)
* http://www.git-scm.com/book/en/v2/Git-Branching-Remote-Branches
* http://stackoverflow.com/questions/17546171/how-to-delete-a-remote-branch-using-git
* http://vim.wikia.com/wiki/A_better_Vimdiff_Git_mergetool
* https://matthew-brett.github.io/pydagogue/vim_mergetool.html
* http://genomewiki.ucsc.edu/index.php/Resolving_merge_conflicts_in_Git
* https://www.kernel.org/pub/software/scm/git/docs/git-merge.html
* http://www.git-scm.com/docs/git-mergetool
