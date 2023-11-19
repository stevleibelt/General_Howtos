# tail dmesg

## by tailing on multiple important files

```
tail -f /var/log/{messages,kernel,dmesg,syslog}
```

## by watching on the output

```
watch 'dmesg | tail -10'
```

## by using option available since kernel 3.5

```
dmesg -w
```

# links

* http://superuser.com/questions/289239/is-it-possible-to-tail-f-the-output-of-dmesg
