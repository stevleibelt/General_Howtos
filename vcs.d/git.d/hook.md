# Git hooks

## General

Git hooks are:

* Scripts executed when an event has happened
* Can be stored on local or remote repositories
* Are only executed in the repository where the event was triggered
* Located in .git/hooks
* If a hook exits with an code not equal 0, git will stop the processing
* Are not copied by a "git clone" (take a look to the [template directory](https://git-scm.com/docs/git-init#_template_directory) mechanism from git to ship and install your hooks)

## Local hooks

```bash
#@see https://www.atlassian.com/git/tutorials/git-hooks - Pre-Commit
#@see https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
#@see https://www.digitalocean.com/community/tutorials/how-to-use-git-hooks-to-automate-development-and-deployment-tasks

# As example using pre-commit
pre-commit validate-config
pre-commit run [hook-id]
```

## Install a Hook

* Create a file with the fitting hook name (e.g. pre-commit) inside .git/hooks
* Kake the file executable

## Links

* [hook section from the git book](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
* [howto from atlassian](https://www.atlassian.com/git/tutorials/git-hooks)
