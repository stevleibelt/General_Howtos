# example

    svn log -c 12345 https://svn.domain.org/trunk
    # shows commit message of revision 12345 on trunk

    svn log --limit 1 https://svn.domain.org/trunk
    # fetch last/newest revision from trunk

    svn log 12321:12345 https://svn.domain.org/trunk
    # show log entries between revision 12321 and 12345 from trunk
