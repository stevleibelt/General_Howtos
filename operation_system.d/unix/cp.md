# copy paste

## select range

```
# assuming you want to copy my_file_name_02.txt, my_file_name_03.txt and my_file_name_04.txt
cp my_file_name_0[2-4].txt <destination>
```

## create symbolic links instead of copy them

```
cp -s <source> <destination>
```

## update content only

```
#great usage with -r
cp -u <source> <destination>
```

# links

* http://www.computerhope.com/unix/ucp.htm
* https://opensource.com/article/17/7/two-great-uses-cp-command
