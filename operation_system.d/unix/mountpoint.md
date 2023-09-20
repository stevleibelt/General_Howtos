# Mountpoint

> checks whether the given directory or file is mentioned in the /proc/self/mountinfo file.

## Check if a given directory is mounted

```bash
if mountpoint -q /mnt/foo/bar;
then
  echo ">>/mnt/foo/bar<< is mounted"
else
  echo ">>/mnt/foo/bar<< is not mounted"
fi
```

## Links

* [Check if directory mounted with bash: stackoverflow.com](https://stackoverflow.com/a/46025626) - 20230915
