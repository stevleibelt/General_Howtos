# list

    git tag -l

# list with pattern

    git tag -l '1.2.3.*'

# checkout

    git checkout tags/<tag_name>

# create

    git tag -a 1.2.3 -m 'version 1.2.3 created because of feature freeze'

# delete

    git tag -d 1.2.3
    git push --delete origin 1.2.3
    git push orgin :refs/tags/1.2.3
    git push --tags
