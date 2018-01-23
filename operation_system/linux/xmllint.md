# xmllint

Useful to validate an xml against an xsd.

# how to validate

```
xmllint --schema foo.xsd foo.xml
```

# how to reduce memory footprint

```
xmllint --schema --stream foo.xsd foo.xml
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

# links

* [bash script variables and xmllint](https://www.experts-exchange.com/questions/28121869/bash-script-variables-and-xmllint.html)
* [xmllint in debian](https://packages.debian.org/sid/libxml2-utils)
* [Tool to validate an XSD on ubuntu linux [closed]](https://stackoverflow.com/questions/4092812/tool-to-validate-an-xsd-on-ubuntu-linux)
