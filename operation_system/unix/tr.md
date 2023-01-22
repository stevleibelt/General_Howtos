# tr

TR stands for **tr**anslate or **tr**ansliterate and is used to replace characters in a string.  
This is a simple tool. If you want to replace words or more complex patterns, you should use [sed](sed.md).

## Examples

```bash
#replace >> << with >>_<<
echo "There is no foo without a bar" | tr ' ' '_';

#delete all >>o<< in a string
echo "There is no foo without a bar" | tr -d 'o';

#convert all lower case characters to upper case ones
echo "There is no foo without a bar" | tr [:lower:]äöü [:upper:]ÄÖÜ

#replace multiple >> << with one
#   -s stands for squeeze repeats
echo 'tra     la  lala alala' | tr -s ' ';

#remove all non abc-characters
echo "123 from torrox to germany!!?=?" | tr -cd '[:alpha:]'

#convert convtent of a file having windows line ending file format into unix format
tr -d '\r' < windows_file.txt > unix_file.txt
```

## Links

* [tr at wikipedia](https://en.wikipedia.org/wiki/Tr_(Unix)) - 20230122

