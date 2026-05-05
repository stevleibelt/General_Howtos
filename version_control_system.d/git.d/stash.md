# save a stash

    git stash save [<name or message>]

# list available stash names

    git stash list

# apply a stash to the current working copy

    git stash apply stash@{<number>}

# remove a stash

    git stash drop stash@{<number>}

## remove last saved stash

    git stash pop

## remove all stashes

    git stash clear

# show diff between stash and current working copy

    git stash show -u 

# links

* http://git-scm.com/book/en/Git-Tools-Stashing
* http://ariejan.net/2008/04/23/git-using-the-stash/
