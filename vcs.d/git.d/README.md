# Git

## gitconfig

### List all used configuration files

```bash
git config --list --show-origin
```

### Sign commits with ssh keys

```bash
# ref: https://docs.gitlab.com/ee/user/project/repository/ssh_signed_commits/
# Change git to ssh signing
git config --global gpg.format ssh
# Automatically sign each commit / let git add >>-S<< to each commit
git config --global commit.gpgsign true

# Specify the ssh key
#   If you have to use a different one, skip --gobal
git config --global user.signingkey ~/.ssh/my_key
```

#### Git configuration files on linux

| Scope | Path |
| --- | --- |
| System Global | `/etc/gitconfig` |
| User Global | `{/home/<username>|/root}/.gitconfig` |
| User Local | `<path to the current repository>.git/config` |
| Worktree Local | `<path to the current repository>.git/config.worktree` |

#### Git configuration files on windows

| Scope | Path |
| --- | --- |
| System Global | `<path to the git installation>\mingw64\etc\gitconig` |
| System Portable | `c:\ProgramData\Git\config` |
| User Global | `c:\users\<user name>.gitconfig` |
| User Local | `<path to the current repository>.git\config` |
| Worktree Local | `<path to the current repository>.git\config.worktree` |

### Edit configuration

```bash
git config -e           #project based
git config -e --global  #global ;-)

#configure a proxy
git config --global http.proxy [http://][proxyuser@]proxy.server[:port]
```

## Show log

```bash
git reflog
git log
```

## Howto's

### Split one big commit into smaller commits

```bash
# ref: https://www.30secondsofcode.org/git/s/split-commit/
# 1.) Fetch the number of previous commits you want to change
# e.g. you want to change the previous two commits
git rebase -i HEAD~2

# 2.) Mark the commit you want to split with `edit`
# 3.) Save and close the editor to start the rebase
# 4.) Unstage the changes
git reset HEAD^
# 5.) Commit the changes separately
git add -p ...
# 6.) Continue the rebase
git rebase --continue
# 6.) Check the logs to confirm the changes
git log --oneline --decorate -4
# 7.) Push the changes
```

### Replace user email and name from previous commits

Do this only if you are the only one using this history (without push to origin)

```bash
# ref: https://stackoverflow.com/a/8434756
# fetch the number of previous commits you want to change
# e.g. you want to change previous four commits
git rebase -i HEAD~4

# below each commit you want to change (line starting with `pick`)
exec git commit --amend --author="New Author Name <email@address.example>" -C HEAD
```

### Remove local changes

```bash
#list possible cleaned objects
git clean -n
#will remove untracked files (-f) and directories (-d)
#   -x: remove also ignored files
#   -X: remove only ignored files
git clean -f -d
#will not remove untracked files
git reset --hard HEAD
#reset to latest remote repository
git reset --hard origin/master
```

### Revert changes on local copy

```bash
git checkout .
```

### Revert changes on index

```bash
git reset
```

### Revert last commited change

```bash
git revert ...
```

### Revert an already pushed commit

```bash
git revert <string: commit checksum>
```

### Revert an already pushed merge commit

```bash
git revert -m1 <string: commit checksum>
```

### Checkout special commit

```bash
git checkout <string: sha1>
```

### Checkout master (resolving detached head issue)

```bash
git checkout master
```

### Switch back to previous branch

```bash
git checkout -
```

### Commit

```bash
git commit -a               #commit all changes
git commit -v               #commit verbosely (includes diff)
git commit --amend          #edit message for the most recent commit, tags: rename, revert
git commit --amend <file>   #redo previous commit including changes from files ...
```

### Undo commit

```bash
git reset --soft HEAD~1
#
git commit --amend
#http://stackoverflow.com/questions/5203535/practical-uses-of-git-reset-soft
#http://git-scm.com/2011/07/11/reset.html
```

## Show differences

```bash
git diff --staged           #show diff using staged instead of commited
```

## Remove

```bash
git rm --cached             #remove files in stage/repository (but not in the filesystem)
```
                                #good if you commited log files or something else you don't want to commit

## Blame

```bash
git blame <file> <revision>
git gui blame
git whatchanged <file>
```

## Add, unadd, delete

### Add a file to the index/staging

```bash
git add <string: file>
git add -A  #all
git add -p  #interactively decide which changes to add
git add -i  #like patch but with no menu
```

### Add changes to stage

```bash
git stage <string: file>
git stage --patch       #interactively decide which changes to add to stage
git stage --interactive #like patch but with no menu
```

### Remove from index/staging

```bash
git reset HEAD -- <string: file>
```

### Remove files from project

```bash
git rm <string: file>
```

### Remove deleted files

```bash
git rm $(git ls-files --deleted)
```

### Add alias

```bash
#simple alias
git config --global alias.unadd 'reset HEAD --'
#complex alias with user input
#   what do wie do?
#   signale that this alias is a shell command by starting with "!"
#   afterwards, we are creating a function with the name "f", add code into it and finally executing it"
my-complex-alias = "!f() { echo \"this is your user input $@\"; }; f"
```

## Reset

### Remove file or directory from stage

```bash
git reset <string: name>
```

### Show information

```bash
git show 1.2.3
```

### Sign with gpg

```bash
git tag -s 1.2.3 -m 'signed version 1.2.3'
```

### Push to repository

```bash
#current head
git push origin HEAD
#to another head
git push origin 1.2.3
```

## Squashing

```bash
#squash last 10 commits to a big one
git rebase --interactive HEAD~10

#merge branch by squashing all commits to one
git merge --squash <branch to merge>
```

## Diamond shape in git log history

```
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
```

[source](http://stackoverflow.com/questions/16666089/whats-the-difference-between-git-merge-and-git-rebase/16666418#16666418)

## Maintenance

```bash
git gc --aggressive
```

## List available hooks

```bash
#@see: https://githooks.com/
git help hooks
```

## Links

* http://try.github.io/
* [12 tips for git](https://opensource.com/article/18/4/12-git-tips-gits-12th-birthday)
* [bitbucket git howto](https://www.atlassian.com/git/tutorials/setting-up-a-repository) - 20210209
* [git concepts](https://opensource.com/article/22/11/git-concepts) - 20221117
* [git hooks](https://githooks.com/) - 20221117
* [Gitting Things Done – A Visual and Practical Guide to Git [Full Book]: freecodecamp.org](https://www.freecodecamp.org/news/gitting-things-done-book/) - 20240209
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
* some plattforms or self hosting services
    * [gitea](https://gitea.io/)
    * [gitolite](http://gitolite.com/)
    * [gitlab](https://www.gitlab.com/)
    * [bitbucket](https://bitbucket.org/)
    * [github](https://github.com/)

