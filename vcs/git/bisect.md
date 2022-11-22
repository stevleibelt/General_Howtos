# git bisect

Git bisect helps you to identify the commit that introduces a bug.

## Howto

* `git bisect start`
* You can either put it `good` or `bad`
* If you've put int `bad`
* git will check out this commit/reference
* Now you can run tests on this code
* Afterwards, put in `good` or `bad`
* Repeat the steps until you are done
* With `git bisect reset` you can finish this process

## Links

* [Git bisect](https://opensource.com/article/22/11/git-bisect) - 20221122

