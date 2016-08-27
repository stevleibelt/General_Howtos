# adding shell script to i3status.conf

You can not add a shell script to the i3status.
But you can add i3status to a shell script.

## example

```
#example_status_script.sh
#!/bin/bash

#we are piping the output of the i3status bar into the while and reading it
#the space after while is important
i3status | while :
do
    read I3STATUS_OUTPUT
    NEW_OUTPUT=""
    #good place to either execute your script or do whatever
    ## begin of example
    CURRENT_SECOND=$(date +%S)
    LAST_NUMBER=${CURRENT_SECOND: -1}

    case ${LAST_NUMBER} in
        1|5|9)
            ${NEW_OUTPUT}+="."
            ;;
        2|4|6|8)
            ${NEW_OUTPUT}+="o"
            ;;
        3|7)
            ${NEW_OUTPUT}+="O"
            ;;
        *)
            ${NEW_OUTPUT}+=" "
    esac
    ## end of example

    ${NEW_OUTPUT}+=" | ${I3STATUS_OUTPUT}"

    echo ${NEW_OUTPUT} || exit 1 
    sleep 1
done
```

# links

* https://faq.i3wm.org/question/4815/adding-shell-script-to-i3statusconf.1.html
* https://pypi.python.org/pypi/py3status
