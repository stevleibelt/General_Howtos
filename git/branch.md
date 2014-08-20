# branch

## list

    git branch      #list all local branches
    git branch -r   #list all remote branches
    git branch -a   #list all local and remote branches

## create new local branch

    git checkout -b my_branch

## switch to a local branch

    git checkout -b my_branch

## switch to a remote branch

    git fetch origin
    git checkout -b my_branch origin/my_branch

## remove local branch

    git branch -d my_branch

## remove remote branch after local deletion

    git push origin :my_branch

## merge

    git checkout master
    git merge my_branch

