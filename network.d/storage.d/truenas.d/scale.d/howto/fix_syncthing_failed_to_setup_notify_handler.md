# Fix >>failed to setup inotify handler. Please increase inotify limits<< on truenas scale for syncthing

## Error

```
failed to setup inotify handler. Please increase inotify limits, see https://docs.syncthing.net/users/faq.html#inotify-limits
```

## Fix

The fix is simple, just login to your truenas scale and click to System Settings -> Advanced -> Sysctl -> Add.

Add Variable `fs.inotify.max_user_watches` with value `204800` and that's it. Happy syncthing!

