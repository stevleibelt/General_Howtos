# example

```
# from local to remote
scp -i <path to ssh key> <source path on the system> <user name>@<host>:<absolute destination path on the server>

# from remote to local
scp -i <path to ssh key> <user name>@<host>:<absolute source path on the server> <destination path on the system>

# using compression
scp -C <source> <target>

# limit bandwith to 666 Kbit/s

scp -l 666 <source> <target>

# presever file attributes

scp -p <source> <target>

# transfere and compress
#   to the destination
tar -czf <source> | ssh <user>@<server> "cat > <path>.tgz"

#   from th destination
ssh <user>@<server> "cd tar -zc <source>" | cat > <target>.tgz
```

# link

* https://unix.stackexchange.com/questions/70581/scp-and-compress-at-the-same-time-no-intermediate-save
* http://www.commandlinefu.com/commands/matching/scp/c2Nw/sort-by-votes
* http://www.binarytides.com/linux-scp-command/
* https://unix.stackexchange.com/questions/70581/scp-and-compress-at-the-same-time-no-intermediate-save
