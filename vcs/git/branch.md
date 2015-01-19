# branch

## prevent tracking upstream branches

    #instead of
    git pull #what is git fetch + git rebase
    #do
    git pull --rebase #what is git fetch + git rebase
    #http://stackoverflow.com/questions/16666089/whats-the-difference-between-git-merge-and-git-rebase/16666418#16666418

## list

    git branch      #list all local branches
    git branch -r   #list all remote branches
    git branch -a   #list all local and remote branches

## create new local branch

    git checkout -b my_branch

## switch to a local branch

    git checkout my_branch

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

