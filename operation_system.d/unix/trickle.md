# what it is

* limit bandwith in user space

# limit download at 80 KB/s

```
-auvPe "trickle -d 80 ssh" user@host:/src/ /dst/
```

# links

* http://dan.folkes.me/2011/03/03/rsync-speed-limit-trickle-slow/
