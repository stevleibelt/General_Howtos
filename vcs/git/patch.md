# create a patch

```
#use the last commit
git format-patch -1

#use the last three commits
git format-patch -3

#use commits between revision (commit id) R1 and R2
git format-patch R1..R2
```

# apply a patch

```
git apply my_patch_file_name.patch
```

# link

* [git - patch operation](https://www.tutorialspoint.com/git/git_patch_operation.htm) - 2018-01-07
