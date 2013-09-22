#!/bin/bash
####
# Puts content into file
#
# @author stev leibelt <artodeto@arcor.de>
# @since 2013-07-09
####

# http://mywiki.wooledge.org/BashGuide/InputAndOutput

touch foo
cat > foo <<EOT
This is an example content for the file.
New line and text.
Done
EOT
