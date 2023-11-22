# unzip

## Unzip archive and create directory

```bash
# this does not work if there are " " in the name
for ARCHIVE in $(ls *.zip);
do
  DIRECTORY_NAME=$(basename $ARCHIVE .zip)

  unzip $ARCHIVE -d $DIRECTORY_NAME
done
```
