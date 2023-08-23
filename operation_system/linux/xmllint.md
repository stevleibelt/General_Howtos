# xmllint

Useful to validate an xml against an xsd.

A xml can only be valiated if there is an xml schema available.

A xml can be well-formed if the syntax of the xml is valid.

## How to check well-formed

```bash
#echo of `0` means "is valid"
#echo of not `0` means "is invalid"
xmllinkt --noout <string: filename>.[xml|xsl]; echo $?
#or
if xmllint --noout <string: filename>.[xml|xsl];
then
  echo "Is valid"
else
  echo "Is invalid"
fi
```

## How to validate

```bash
xmllint --noout --schema foo.xsd foo.xml; echo $?
```

## How to reduce memory footprint

```bash
xmllint --noout --schema --stream foo.xsd foo.xml; echo $?
```

## How to prettify a xml

```bash
#You can play arround with xml environment variables to change the output
#e.g.
#   export XMLLINT_INDENT="        "
#Furthermore, there are more options
#--dropdtd  - Removes DTD
#--noblanks - Removes blank lines and empty spaces
xmllint --format <string: filename>.[xml|xsl]
```

## Query XML with xpath

```bash
xmllint --xpath //my/path <string: filename>.[xml|xsl]
#or
xmllint --xpath '//my/path/text()' <string: filename>.[xml|xsl]
```

## Profile xml

```bash
xmllint --noout --timing --repeat <string: filename>.[xml|xsl]
```

## Interactive mode

So I must admit, this is amazing. Thank you developers of xmllint. I thought that the xpath support was crazy but this, wow!

```bash
#Following commands are available (and even more)
#cd <string: node>          - Navigate in the document
#pwd                        - Print current xml node path
#cat                        - Print content of current node
#cat <string: xpath>        - Print content of xpath target
#write <string: filename>   - Write content of current node to filename
#STRG+C                     - Quit interactive mode
xmllint --shell <string: filename>.[xml|xsl]
```

## Links

* [bash script variables and xmllint](https://www.experts-exchange.com/questions/28121869/bash-script-variables-and-xmllint.html)
* [xmllint in debian](https://packages.debian.org/sid/libxml2-utils)
* [Tool to validate an XSD on ubuntu linux [closed]](https://stackoverflow.com/questions/4092812/tool-to-validate-an-xsd-on-ubuntu-linux)
* [xmllint in Linux: baeldung.com](https://www.baeldung.com/linux/xmllint) - 20230823
