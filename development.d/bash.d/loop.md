# example

## while

```bash
#!/bin/bash
ITERATOR=1
LIMIT=10
while [ $ITERATOR -le $LIMIT ]
do
    echo $ITERATOR' run'
    ((++ITERATOR))
    sleep 1s
done
```

## for

```bash
#as one liner, perfect for quick command line hacking
for ITERATOR in *.extension; do echo "${ITERATOR}"; done

#as multiliner, perfect for code in scripts
for ITERATOR in *.extension
do
    echo "${ITERATOR}"
done
```

# links

* http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_02.html
* http://www.cyberciti.biz/faq/bash-while-loop/
* http://linux.about.com/od/Bash_Scripting_Solutions/a/How-To-Write-Bash-While-Loops.htm
* http://ccm.net/faq/6344-linux-bash-command-to-compress-video
