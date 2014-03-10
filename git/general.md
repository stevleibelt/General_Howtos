Log
===

git reflog
git log

Remove Local Changes
====================

git clean -f -d #will remove untracked files (-f) and directories (-d)
git reset --hard HEAD #will not remove untracked files

Revert Changes On Local Copy
----------------------------

git checkout .

Revert Changes On Index
-----------------------

git reset

Revert Last Commited Change
---------------------------

git revert ...


Add And Unadd
=============

Add a file to the index/staging
-------------------------------

git add

Add all files
-------------

git add -A

Remove from index/staging
-------------------------

git reset HEAD -- $file

Add alias
---------

git config --global alias.unadd 'reset HEAD --'

Branch
======

create new local branch
-----------------------

git checkout -b my_branch

switch to a local branch
------------------------

git checkout -b my_branch

switch to a remote branch
-------------------------

git fetch origin
git checkout -b my_branch origin/my_branch

remove local branch
-------------------

git branch -d my_branch

Remove remote branch after local deletion
-----------------------------------------

git push origin :my_branch

Merge
-----

git checkout master
git merge my_branch

Reset
=====

remove file or directory from stage
-----------------------------------

git reset <name>

Tag
===

list
----

git tag -l

list with pattern
-----------------

git tag -l '1.2.3.*'

checkout
--------

git checkout tags/<tag_name>

create
------

git tag -a 1.2.3 -m 'version 1.2.3 created because of feature freeze'

delete
------

git tag -d 1.2.3
git push --delete origin 1.2.3
git push orgin :refs/tags/1.2.3
git push --tags

show information
----------------

git show 1.2.3

sign with gpg
-------------

git tag -s 1.2.3 -m 'signed version 1.2.3'

push to repository
------------------

git push origin 1.2.3

links
=====

* http://try.github.io/
* https://www.kernel.org/pub/software/scm/git/docs/git-checkout.html
* http://git-scm.com/book/de
* http://git-scm.com/book/de/Git-Grundlagen-Tags
* http://nathanhoad.net/how-to-delete-a-remote-git-tag
* http://data.agaric.com/undo-git-add-remove-files-staged-git-commit
