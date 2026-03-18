# Sed examples

## Use user input instead of file

```bash
# Given is the fact that we have files in the path of:
#   /usr/local/www/apache24/data
# and we want to convert this to an https link prefixed with:
#   https://download.bazzline.net
# We provide the file path as argument to sed
#
# sed
# 	s: substitute
# 	|: use >>|<< as delimiter to ease up handling of >>/<<
# 	^\/usr/local...\(*\): search for >>/usr/local/...<< at the beginning and put the rest as content of matching group ()
# 	|https://...: prefix the content of matching group 1 with >>https:/...<<
sed 's|^/usr/local/www/apache24/data/\(\)|https://download.bazzline.net/\1|' <<< "/usr/local/www/apache24/data/media/image/quake3.png"
```

## Show line number x 

```bash
# Shows line number 4 from 'file'
cat file | sed -n '4p'
```

## Replace entire/whole line

```bash
sed -e '/^my_start_of_the_line/c\my_replace_of_the_line' myfile
```

## Replace every occurrences in a text file

```bash
sed -e 's/originaltext/newtext/g' file.txt
# Replace each tab with a few spaces
sed -e 's/\t/  /g' file.txt
```

## Extract content from file

```bash
sed -n -e 's/^.*MyWord\ with\ whitespaces\ "\(.*\)"\ and\ more.*/\1/p' sourceFile > destinationFile
```
## Extract single xml tag

```bash
# Get all content between tag "mylink" from xml
sed -n -e 's/.*<mylink>\(.*\)<\/mylink>.*/\1/p' exampleXml > myfile
```

## Matching end pattern

```bash
sed -n -e 's/^.*\/my\/endline\ pattern\(.*\)$/\1/p' < source.file | sort | uniq -c > destination.file. sort_and_uniq
```

## Slice text

```bash
# Assume we have lines like the following
#   foobar.xsl:							<fo:block font-weight="bold"><xsl:value-of select="//Foo/BazFoo" /></fo:block>
#   templates/barfoo.xsl:				<xsl:apply-templates select="foo/ap.foo.reports.foobar.content.baz"/>

# -e    : Execute the following script command
# -n    : Do not print out pattern space
# \1    : Print out the matching content from \(.*\)
# /pg   : Copy/Append hold space to pattern space and print out this
#           This is needed since we told sed with -e to NOT print out
#           Pattern space
sed -n -e 's/^.*\ select="\(.*\)".*$/\1/pg'

# Outputs
#   //Foo/BazFoo
#   foo/ap.foo.reports.foobar.content.baz
```

## Sed in place

In place means, no addition/backup file will be created.

```bash
sed -i 's/something\ i\ want\ to\ replace/my\ new\ data/g' path/to/file.txt

# Delete lines starting with
sed '/^foo/d' path/to/the.file

# Delete empty lines
sed '/^$/d' path/to/the.file

# Create backup file
sed --in-place=.old -e 's/newtext/oldtext/g' file.txt
```

## Prefix each line of a file

```bash
# Prefixes each line with a >
sed -e 's/^/>/' file.txt
```

## Use a file with the rules

```bash
# Content of my_rule.sed is
# s/^/>/
# s/\t/  /g
sed -f my_rule.sed file.txt
```

