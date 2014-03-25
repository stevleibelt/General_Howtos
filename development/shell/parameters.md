# first nine parameters

* $#        -   number of provided parameters
* $@        -   all provided parameters as a white space separated string
* $*        -   all provided parameters as a list/array
* $$        -   process id of current script
* $?        -   exist status of last command
* $0        -   script name
* $[1-9]    -   [first-ninth] parameter value (use shift <positive number> to reallocate $[1-9]

# set them new

    set -- foo bar foobar super

# assign default values

## if no or empty value provided

${<parameter>:-<value>}

    VAR=${1:-'foo'} #set $1 to 'foo' if not provided

## if is not set or empty

${<parameter>:=<value>}

    ${VAR:='foo'} #set $VAR to 'foo' if $VAR is empty or not set

## set value if set

${<parameter>:+<value>} #opposite of previous

## output error message if is empty

${<parameter>:?<error message>}

# get parameter length

${#<parameter>}

# remove suffix

${<parameter>%<suffix>}     #shortest match
${<parameter>%%<suffix>}    #longest match

# remove prefix

${<parameter>#<prefix>}     #shortest match
${<parameter>##<prefix>}    #longest match

# part of a parameter

${<parameter>:<offset>[:<length>]}

# getopts

getopts <options_string> <variable_name> [<argument>]
