# grep useful information about one ip address

    ```
    netstat -nat | grep <ip address>
    #netstat -nat |grep {IP-address} | awk '{print $6}' | sort | uniq -c | sort -n
    ``` 

# links

* http://www.cyberciti.biz/tips/netstat-command-tutorial-examples.html
