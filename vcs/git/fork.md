# keep fork in sync

## list avaiable remote address


```shell
git remote -v
```

## add source as upstream

```shell
git remote add upstream https://git.my-domain.org/repository
```

## fetch from upstream

```shell
# update upstream branches
git fetch upstream
# switch to local master branch
git checkout master
# merge
git merge upstream/master
```

# links

* https://help.github.com/articles/fork-a-repo
* https://help.github.com/articles/syncing-a-fork
