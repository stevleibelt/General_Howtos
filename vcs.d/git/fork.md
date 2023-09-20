# Git fork

## Keep fork in sync

## list avaiable remote address

```bash
git remote -v
```

### add source as upstream or original

```bash
#git remote add original https://git.my-domain.org/repository
git remote add upstream https://git.my-domain.org/repository
```

### Fetch from original

```bash
# update original branches
#git fetch original
git fetch upstream

# switch to local master branch
git checkout master #the branch you want to update
# merge
#git merge original/master
git merge --no-ff upstream/master

# or rebase if needed
#git rebase original/master
git rebase upstream/master
```

## Links

* https://help.github.com/articles/fork-a-repo
* https://help.github.com/articles/syncing-a-fork
* https://stackoverflow.com/questions/8948803/what-does-git-remote-add-upstream-help-achieve
* http://stackoverflow.com/questions/21917459/git-set-upstream-to-origin#21917622

