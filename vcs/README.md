# Version Control System

## Commit Message Guidelines

### Reasons and benefits of having guidelines

The big benefit of having a guideline is that it is makinge the life easier when working in a team. It is comparable with coding guide lines, including all benefits and limitations.

Good commit messages helping your teammembers to have fun when reviewing your changes and it ease up the willing to do so.

While writing good commit messages, you are doing a rubber duck debugging with your self. This takes time but the time is well spend.

Fourthermore, good commit messages are a way to provide help for your future self. Once you have to read your `git log` from the past, you can thank your past self that he was so kind to you.

Finally, good commit messages can be used to automatically generate release notes. Once you have to do this by hand, you will adore commit message guidelines.

### Example guidelines

Especially for the lenght of a message but a rule of thump for all of the following bullet points, if it is hard to stick to a guideline, the chance is high you try to commit to much of a change.

* Do not write a message in a hurry
* Follow your teams convention
* No whitespace errors (use `git diff --check`)
* A commit should contain a logically separated changeset (change should solve one issue)
* A commit is cheap, use it and make the change digestible/easy to understand
* Use `git add --patch` to commit changes solving one issue at once
* Capitalize first word and do not end with a punctuation
* First line should summerize the change in less than 50 characters
  * Optionally, you can have a more detailed changelog after one blank line
    * This can be achived by `git commit -m "title" -m "detailed description"` too
    * The body should be wrapped by 72 characters
  * Bullet points are okay but should be devided by a blank line
  * You can use a separeted footer to link to a ticket system like `[Closes|Fixes] #ticketnumber`
* Use the imperative "Fix bug" instead of "Fixed bug" or "Fixes bug"
  * This gives toe tone that you are giving an order or a request
* Type your commit (`<type>[optional scrope]: <short description>`), example types are
  * build (changes made for the build system)
  * ci (changes made for ci configuration files and scripts)
  * chore (updating grund tasks etc., no production code change)
  * docs (changes to the documentation)
  * fix (bugfix for the user, not a fix to a build script)
  * feat (new feature for the user, not a new feature for the build script)
  * perf (a code change that improves performance)
  * refactor (refactoring production code, e.g. renaming a variable)
  * revert ('This reverts commit <SHA>' including a clear description why this revert is needed)
  * style (formatting, missing semi colons etc, no production code change)
  * test (adding missing tests, refactoring tests, no production code change)
  * update
* If needed, insert a big and uppercase `BREAKING CHANGE` section with description ala 'Behavior changes from <old> to <new>'
* If needed, insert a big and uppercase `DEPRECATED` section with description ala 'what is deprecated'
* Keep the message short and eliminate filler words or phrases, try to answer the following questions with your message
  * Why have I made this change?
  * What effect have my changes made?
  * Why was the change needed?
  * What are the changes in reference to?
* Never ever commit any secrets (passwords, tls keys)
* If your past message is bad, use the git tools to [rewrite the history](https://initialcommit.com/blog/4-git-commands-rewrite-commit-history)
* Give it a try and use `git commit -v`

### Examples with good and bad messages

* [&cross;] 'Add margin'
* [&check;] 'Add margin to nav items to prevent them from overlapping the logo'
* [&cross;] 'fixed bug on landing page'
* [&check;] 'bugfix: Fix bug preventing users from submitting the subscribe form'
* [&cross;] 'debugging'
* [&check;] 'Enable logging globally'
* [&cross;] 'initial commit'
* [&check;] 'Add README.md'
* [&check;] 'Initialize Project\n- Add README.md\n- Add .gitignore'

## Links

* [List of version-control software: wikipedia.org](https://en.wikipedia.org/wiki/List_of_version-control_software) - 20230505
* Commit Message Guidelines
  * [Commit Guidelines: git-scm.com](https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project#_commit_guidelines) - 20230505
  * [Git commit messages: best practices and guidelines: initialcommit.com](https://initialcommit.com/blog/git-commit-messages-best-practices) - 20230505
  * [How to level up your git commit messages: freecodecamp.org](https://www.freecodecamp.org/news/how-to-write-better-git-commit-messages/) - 20230505
  * [How to write the perfect commit message: git-tower.com](https://www.git-tower.com/blog/how-to-write-the-perfect-commit-message/) - 20230505
  * [Semantic commit messages: github.com](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716) - 20230505

