# edit configuration

    git config -e           #project based
    git config -e --global  #global ;-)

# log

    git reflog
    git log

# remove local changes

    git clean -f -d #will remove untracked files (-f) and directories (-d)
    git reset --hard HEAD #will not remove untracked files

## revert changes on local copy

    git checkout .

## revert changes on index

    git reset

## revert last commited change

    git revert ...

# commit

    git commit -a               #commit all changes
    git commit -v               #commit verbosely (includes diff)
    git commit --amende         #edit message for the most recent commit
    git commit --amende <file>  #redo previous commit including changes from files ...

# diff

    git diff --staged           #show diff using staged instead of commited

# rm

    git rm --cached             #remove files in stage/repository (but not in the filesystem)
                                #good if you commited log files or something else you don't want to commit

# blame

    git blame <file> <revision>
    git gui blame
    git whatchanged <file>

# add, unadd, delete

## add a file to the index/staging

    git add <file>
    git add -A  #all
    git add -p  #interactively decide which changes to add
    git add -i  #like patch but with no menu

## add changes to stage

    git stage <file>
    git stage --patch       #interactively decide which changes to add to stage
    git stage --interactive #like patch but with no menu

## remove from index/staging

    git reset HEAD -- $file

## remove files from project

    git rm <file>

## remove deleted files

    git rm $(git ls-files --deleted)

## add alias

    git config --global alias.unadd 'reset HEAD --'

# Reset

## remove file or directory from stage

    git reset <name>

## show information

    git show 1.2.3

## sign with gpg

    git tag -s 1.2.3 -m 'signed version 1.2.3'

## push to repository

    git push origin 1.2.3

# squashing

    git rebase --interactive HEAD~10    #squash last 10 commits to a big one

# links

* http://try.github.io/
* https://www.kernel.org/pub/software/scm/git/docs/git-checkout.html
* http://git-scm.com/book/de
* http://git-scm.com/book/de/Git-Grundlagen-Tags
* http://nathanhoad.net/how-to-delete-a-remote-git-tag
* http://data.agaric.com/undo-git-add-remove-files-staged-git-commit
* https://gist.github.com/iansheridan/870778
