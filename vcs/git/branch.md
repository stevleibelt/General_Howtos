# branch

## prevent tracking upstream branches

    #instead of
    git pull #what is git fetch + git rebase
    #do
    git pull --rebase #what is git fetch + git rebase
    #http://stackoverflow.com/questions/16666089/whats-the-difference-between-git-merge-and-git-rebase/16666418#16666418

## list

    git branch                      #list all local branches
    git branch -r                   #list all remote branches - cached information
    git remote show origin          #list all remote branches - realtime information
    git ls-remote --heads origin    #list all remote branches - realtime information
    git branch -a                   #list all local and remote branches - cached information

## update remote branches

    git remote prune origin

## create new local branch

    git checkout -b my_branch

## switch to a local branch

    git checkout my_branch

## switch to a remote branch

    #update remote available branch references/list
    git fetch origin
    #switch to branch
    git checkout -b my_branch origin/my_branch

## remove local branch

    git branch -d my_branch

## remove remote branch after local deletion

    git push origin --delete my_branch
    #or
    git push origin :my_branch

## merge

    git checkout master
    git merge my_branch

# links

* http://www.git-scm.com/book/en/v2/Git-Branching-Remote-Branches
* http://stackoverflow.com/questions/17546171/how-to-delete-a-remote-branch-using-git
