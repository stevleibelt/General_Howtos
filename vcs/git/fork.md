# keep fork in sync

## list avaiable remote address

    git remote -v

## add source as upstream

    git remote add upstream https://git.my-domain.org/repository

## fetch from upstream

    # update upstream branches
    git fetch upstream
    # switch to local master branch
    git checkout master
    # merge
    git merge upstream/master
    # or rebase if needed
    git rebase upstream/master

# links

* https://help.github.com/articles/fork-a-repo
* https://help.github.com/articles/syncing-a-fork
* https://stackoverflow.com/questions/8948803/what-does-git-remote-add-upstream-help-achieve
