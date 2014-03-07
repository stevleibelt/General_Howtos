#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-07
#
# links:
#    * http://www.tldp.org/LDP/abs/html/string-manipulation.html
#    * http://stackoverflow.com/questions/15351423/how-to-get-part-of-the-string-in-bash
#    * https://www.linuxquestions.org/questions/linux-newbie-8/simple-bash-script-help-grabbing-part-of-a-string-316917/
####

STRING='FooBar-1.2.3-baz.tar.gz';

#substringing with positions
WITHOUT_FOO=${STRING:3};
ONLY_NUMBERS=${STRING:7:5};

echo 'string is: '$STRING;
echo 'without Foo: '$WITHOUT_FOO;
echo 'only numbers: '$ONLY_NUMBERS;
