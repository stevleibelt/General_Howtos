# example

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

# links

* http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_02.html
* http://www.cyberciti.biz/faq/bash-while-loop/
* http://linux.about.com/od/Bash_Scripting_Solutions/a/How-To-Write-Bash-While-Loops.htm
