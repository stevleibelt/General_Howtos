# Git tag

## Common commands

```bash
# list available tags
git tag -l

# list with filter by using patterns
git tag -l '1.2.3.*'

# create a tag
git tag -a 1.2.3 -m 'version 1.2.3 created because of feature freeze'

# delete a tag
git tag -d 1.2.3
git push --delete origin 1.2.3
git push orgin :refs/tags/1.2.3
git push --tags

# rename a tag
#   ^{} is important and not a mistake!
#   This tells git to dereference the object
#   ref: https://git-scm.com/docs/gitrevisions#Documentation/gitrevisions.txt-emltrevgtemegemv0998em
git tag -a newtag oldtag^{}
git tag -d oldtag
git push origin newtag :oldtag

# checkout a tag
git checkout tags/<tag_name>

# create a branch from a tag
git checkout -b <branch name> <tag name>
```

