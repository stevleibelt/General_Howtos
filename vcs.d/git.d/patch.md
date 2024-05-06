# Git and patching

## Create a patch

```bash
#use the last commit
git format-patch -1

#use the last three commits
git format-patch -3

#use commits between revision (commit id) R1 and R2
git format-patch R1..R2
```

## Apply a patch

```bash
git apply my_patch_file_name.patch
```

## Links

* [git - patch operation](https://www.tutorialspoint.com/git/git_patch_operation.htm) - 20180107

