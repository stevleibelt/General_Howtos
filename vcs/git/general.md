# edit configuration

```
git config -e           #project based
git config -e --global  #global ;-)
```

# log

```
git reflog
git log
```

# remove local changes

```
git clean -f -d #will remove untracked files (-f) and directories (-d)
git reset --hard HEAD #will not remove untracked files
```

## revert changes on local copy

```
git checkout .
```

## revert changes on index

```
git reset
```

## revert last commited change

```
git revert ...
```

## revert an already pushed commit

```
git revert <commit checksum>
```

## revert an already pushed merge commit

```
git revert -m1 <commit checksum>
```

## checkout special commit

```
git checkout <sha1>
```

## checkout master (resolving detached head issue)

```
git checkout master
```

## switch back to previous branch

```
git checkout -
```

# commit

```
git commit -a               #commit all changes
git commit -v               #commit verbosely (includes diff)
git commit --amend          #edit message for the most recent commit
git commit --amend <file>   #redo previous commit including changes from files ...
```

## undo commit

```
git reset --soft HEAD~1
#
git commit --amend
#http://stackoverflow.com/questions/5203535/practical-uses-of-git-reset-soft
#http://git-scm.com/2011/07/11/reset.html
```

# diff

```
git diff --staged           #show diff using staged instead of commited
```

# rm

```
git rm --cached             #remove files in stage/repository (but not in the filesystem)
```
                                #good if you commited log files or something else you don't want to commit

# blame

```
git blame <file> <revision>
git gui blame
git whatchanged <file>
```

# add, unadd, delete

## add a file to the index/staging

```
git add <file>
git add -A  #all
git add -p  #interactively decide which changes to add
git add -i  #like patch but with no menu
```

## add changes to stage

```
git stage <file>
git stage --patch       #interactively decide which changes to add to stage
git stage --interactive #like patch but with no menu
```

## remove from index/staging

```
git reset HEAD -- $file
```

## remove files from project

```
git rm <file>
```

## remove deleted files

```
git rm $(git ls-files --deleted)
```

## add alias

```
#simple alias
git config --global alias.unadd 'reset HEAD --'
#complex alias with user input
#   what do wie do?
#   signale that this alias is a shell command by starting with "!"
#   afterwards, we are creating a function with the name "f", add code into it and finally executing it"
my-complex-alias = "!f() { echo \"this is your user input $@\"; }; f"
```

# Reset

## remove file or directory from stage

```
git reset <name>
```

## show information

```
git show 1.2.3
```

## sign with gpg

```
git tag -s 1.2.3 -m 'signed version 1.2.3'
```

## push to repository

```
#current head
git push origin HEAD
#to another head
git push origin 1.2.3
```

# squashing

```
git rebase --interactive HEAD~10    #squash last 10 commits to a big one
```

# diamond shape in git log history

    Suppose originally there were 3 commits, A,B,C:

    Then developer Dan created commit D, and developer Ed created commit E:

    Obviously, this conflict should be resolved somehow. For this, there are 2 ways:

    MERGE:

    Both commits D and E are still here, but we create merge commit M that inherits changes from both D and E. However, this creates diamond shape, which many people find very confusing.

    REBASE:

    We create commit R, which actual file content is identical to that of merge commit M above. But, we get rid of commit E, like it never existed (denoted by dots - vanishing line). Because of this obliteration, E should be local to developer Ed and should have never been pushed to any other repository. Advantage of rebase is that diamond shape is avoided, and history stays nice straight line - most developers love that!

    The man pages are one almighty “fuck you”. They describe the commands from the perspective of a computer scientist, not a user. Case in point:

        git-push – Update remote refs along with associated objects

    Here’s a description for humans:

        git-push – Upload changes from your local repository into a remote repository

    Update, another example: (thanks cgd)

        git-rebase – Forward-port local commits to the updated upstream head

    Translation:

        git-rebase – Sequentially regenerate a series of commits so they can be 
    applied directly to the head node

    And then we have

        git-merge - Join two or more development histories together

    which is a good description.

[source](http://stackoverflow.com/questions/16666089/whats-the-difference-between-git-merge-and-git-rebase/16666418#16666418)

# maintenance

```
git gc --aggressive
```

# list available hooks

```
git help hooks
```

# links

* http://try.github.io/
* http://ricardofilipe.com/projects/firstaidgit/
* https://git.wiki.kernel.org/
* https://www.kernel.org/pub/software/scm/git/docs/git-checkout.html
* https://www.kernel.org/pub/software/scm/git/docs/everyday.html
* http://git-scm.com/book/de
* http://git-scm.com/book/de/Git-Grundlagen-Tags
* http://nathanhoad.net/how-to-delete-a-remote-git-tag
* http://data.agaric.com/undo-git-add-remove-files-staged-git-commit
* https://gist.github.com/iansheridan/870778
* http://stevebennett.me/2012/02/24/10-things-i-hate-about-git/
* http://www.pro-linux.de/artikel/2/1742/git-tutorium-teil-1.html
* http://www.pro-linux.de/artikel/2/1746/git-tutorium-teil-2.html
* http://www.pro-linux.de/artikel/2/1752/git-tutorium-teil-3.html
* http://www.pro-linux.de/artikel/2/1777/git-tutorium-teil-4-github.html
* http://christoph.ruegg.name/blog/git-howto-revert-a-commit-already-pushed-to-a-remote-reposit.html
* [deutsche git anleitung](http://www-cs-students.stanford.edu/~blynn/gitmagic/intl/de/)
