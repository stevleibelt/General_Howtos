# error

## XMLReader::readInnerXml() parser error : xmlParseEntityRef: no name

Short answer, "&", "<", ">" are illegal characters.
[Long answer](http://stackoverflow.com/a/21978337).

```
Problem: An XML parser returns the error “xmlParseEntityRef: noname”

Cause: There is a stray ‘&’ (ampersand character) somewhere in the XML text eg. some text & some more text

Solution:

Solution 1: Remove the ampersand.
Solution 2: Encode the ampersand (that is replace the '&' character with '& amp;' ). Remember to Decode when reading the XML text.
Solution 3: Use CDATA sections (text inside a CDATA section will be ignored by the parser.) eg.
Note: ‘&’ ‘<' '>‘ will all give problems if not handled correctly.
```
