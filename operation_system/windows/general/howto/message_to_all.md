# Send a message to all users (on a terminal server)

Use `msg /?` if you want to know more.

```
#* = all users, you can also filter by user id or user name
#   instead of >>*<<, you can use >>@c:\path\to\my\user_list.txt<<
#/time:10 = message disapears after 10 seconds
msg * /server:my.server.local /time:10 "my message"
```
