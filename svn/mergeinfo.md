# example

    svn mergeinfo --show-revs eligible https://svn.domain.net/trunk https://svn.domain.net/releases/1.2.3
    #show merges that are in the trunk but not in the release

    svn mergeinfo --show-revs eligible https://svn.domain.net/releases/1.2.2 https://svn.domain.net/releases/1.2.3
    #show merges that are in the release 1.2.3 but not in the 1.2.2
