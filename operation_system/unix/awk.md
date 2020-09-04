# change default separator

```
#use ";" as separator instead of default " "
awk 'BEGIN { FS = ";" } ; { print $1 }'
```

# show lines longer than X characters

```
#show lines longer than 100 characters
awk 'length > 100'
```

# print all but the first element

```
awk '{$1="", $0}' <file path>
```

# awk in a nutshell

```
#fields
# According to the following line
#
# $1         $2    $3
# 00:34:23   GET   /foo/bar.html
# \_____________  _____________/
#               $0

# Hack attempt?
/admin.html$/ && $2 == "DELETE" {
  print "Hacker Alert!";
  
}

#actions
{ print $0;  }  # prints $0. In this case, equivalent to 'print' alone
{ exit;  }      # ends the program
{ next;  }      # skips to the next line of input
{ a=$1; b=$0  } # variable assignment
{ c[$1] = $2  } # variable assignment (array)

{ if (BOOLEAN) { ACTION  }
  else if (BOOLEAN) { ACTION  }
  else { ACTION  }
}
{ for (i=1; i<x; i++) { ACTION  }  }
{ for (item in c) { ACTION  }  }

#functions
#@see: https://www.gnu.org/software/gawk/manual/html_node/Built_002din.html#Built_002din
##call
{ myfunctioncall ($1) }
##create
# function arguments are call-by-value
function name(parameter-list) {
     ACTIONS; # same actions as usual
     
}

# return is a valid keyword
function add1(val) {
     return val+1;
     
}

#special variables
BEGIN { # Can be modified by the user
    FS = ",";   # Field Separator
    RS = "\n";  # Record Separator (lines)
    OFS = " ";  # Output Field Separator
    ORS = "\n"; # Output Record Separator (lines)
}
{ # Can't be modified by the user
    NF          # Number of Fields in the current Record (line)
    NR          # Number of Records seen so far
    ARGV / ARGC # Script Arguments
}
```

# links

* [A practical guide to learning awk](https://opensource.com/article/20/9/awk-ebook) - 20200904
* [awk in 20 minutes](https://ferd.ca/awk-in-20-minutes.html) - 20200508
* http://www.grymoire.com/Unix/Awk.html
* https://www.gnu.org/software/gawk/manual/gawk.html#Printf-Examples
* https://www.gnu.org/software/gawk/manual/gawk.html#Print
* http://www.staff.science.uu.nl/~oostr102/docs/nawk/nawk_23.html
* https://en.wikipedia.org/wiki/AWK
* https://ma.ttias.be/awk-trick-show-lines-longer-x-characters/
