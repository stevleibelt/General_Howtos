# xmllint

Useful to validate an xml against an xsd.

# how to validate

```
mllint --schema foo.xsd foo.xml
```

# how to validate inside a bash script

```
#assuming your xsd file has the name "foo.xsd" and your xml file has the name "foo.xml"
if xmllint --noout --schema foo.xsd foo.xml >/dev/null 2>&1;
then
    echo "xml is valid"
else
    echo "xml is not valid"
fi
```
