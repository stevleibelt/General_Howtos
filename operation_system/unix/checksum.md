# create a checksum (md5, sha1sum, sha256sum, sha512sum)

```
#display checksum
sha512sum <path to the file>

#create a checksum file
#note: you should place the checksum file in the same path like the file you want to check
sha512sum <file name> <checksum file name>.sha512sum
```

# check against a checksum file

```
sha512sum -c <checksum file name>.sha512sum
```

# check within a shell script

```
if sha512sum -c --quiet --status <checksum file name>.sha512sum;
then
    echo "integrity of the file is ok."
else
    echo "integrity of the file is not ok (checksum does not match),"
fi
```
