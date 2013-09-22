#!/bin/bash
####
# Example of how to use heredoc
#
# @author stev leibelt <artodeto@arcor.de>
# @since 2013-07-09
####

# inspired by http://stackoverflow.com/questions/1167746/how-to-assign-a-heredoc-value-to-a-variable-in-bash

VARIABLE_IN_HEREDOC="foo"

VARIABLE_FILLED_BY_HEREDOC=$(cat <<EOT
there is no $VARIABLE_IN_HEREDOC without a bar\n
newline test\n
and we are done
special characters \`$VARIABLE_IN_HEREDOC\` (bar) 'foobar'
EOT
)

echo -e $VARIABLE_FILLED_BY_HEREDOC
