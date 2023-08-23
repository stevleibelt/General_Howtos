# xmllint

Useful to validate an xml against an xsd.

## How to validate

```bash
xmllint --schema foo.xsd foo.xml
```

## How to reduce memory footprint

```bash
xmllint --schema --stream foo.xsd foo.xml
```

## How to validate inside a bash script

```bash
#assuming your xsd file has the name "foo.xsd" and your xml file has the name "foo.xml"
if xmllint --noout --schema foo.xsd foo.xml >/dev/null 2>&1;
then
    echo "xml is valid"
else
    echo "xml is not valid"
fi
```

## Links

* [bash script variables and xmllint](https://www.experts-exchange.com/questions/28121869/bash-script-variables-and-xmllint.html)
* [xmllint in debian](https://packages.debian.org/sid/libxml2-utils)
* [Tool to validate an XSD on ubuntu linux [closed]](https://stackoverflow.com/questions/4092812/tool-to-validate-an-xsd-on-ubuntu-linux)
