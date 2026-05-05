# Configure remote hosts

You can configure multiple remote hosts in git.

Yo can do all by just editing the `.git/config` or by using the cli approach.

## Add a remote mirror

* Please, read about [what you want](https://git-scm.com/docs/git-remote#_commands)
* Personally, I want to setup a push mirror
* `git remote add --mirror=push <mirror name> <mirror url>`
* In the `.git/config`, it would look like this

```bash
[remote "<mirror name>"]
  url = <mirror url>
  mirror = true
```

To push to this mirror too, just write `git push --all`.

