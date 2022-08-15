# ODF

**O**pen**D**ocument**F**ormat is an xml file specification.

ODT is an ODF file including other files wrapped in a zip file container.

## ODF file

Most important elements inside the zip file structure:

* `mimetype`, used for ofice to figure out the programm that process this file (like libre writer)
* `META-INF/manifest.xml`, contains all the information where to find components of this ODT file
* `content.xml`, contains the actual content of the document
* `Pictures`, directory containing used images

## Links

* [ODT-Files](https://opensource.com/article/22/8/odt-files) - 20220815

