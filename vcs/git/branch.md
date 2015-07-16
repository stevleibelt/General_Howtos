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
    # same result
    git fetch --prune

## create new local branch

    git checkout -b my_branch

## create new local branch from tag

    git checkout <your branch you want to branch from, e.g. master>
    # assuming you want to create a branch from tag "1.0"
    git checkout -b <branch name> <tag name>

## create new remote branch from existing local branch

    git push origin <local branch name>:<remote branch name>

## create from remote branch / switch to remote branch

    #update the remote-tracking branches
    #@see https://www.kernel.org/pub/software/scm/git/docs/git-fetch.html
    git fetch origin
    #switch to branch
    git checkout -b my_branch origin/my_branch

## switch to a local branch

    git checkout <local branch name>

# switch to a tag of master

    git checkout master
    git pull
    git checkout -b my_branch refs/tags/<tag name>

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
