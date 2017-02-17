# general

git hooks are:

* scripts executed when an event has happened
* can be stored on local or remote repositories
* are only executed in the repository where the event was triggered
* located in .git/hooks
* if a hook exits with an code not equal 0, git will stop the processing
* are not copied by a "git clone" (take a look to the [template directory](https://git-scm.com/docs/git-init#_template_directory) mechanism from git to ship and install your hooks)

# server side hooks

# local hooks

```
#@see https://www.atlassian.com/git/tutorials/git-hooks - Pre-Commit
#@see https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
#@see https://www.digitalocean.com/community/tutorials/how-to-use-git-hooks-to-automate-development-and-deployment-tasks
```

# "install a hook"

* create a file with the fitting hook name (e.g. pre-commit) inside .git/hooks
* make the file executable

# links

* [hook section from the git book](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
* [howto from atlassian](https://www.atlassian.com/git/tutorials/git-hooks)
