# Import data from old profile

It can be that copy and pasting the whole local mozilla firefox profiles path does not result into a working profile.

Mozilla firefox will start but instantly create a new profile and will report that it can't deal with this old profile.
To not loose all the important informations of the old profile, you can copy a few files.

## Table of files with description

| What it contains | Filename |
| autocomplete history | formhistory.sqlite |
| bookmarks | places.sqlite |
| | favicons.sqlite |
| cookies | cookies.sqlite |
| file type handling and download actions | handlers.json |
| personal directory | persdict.dat |
| search engines | search.json.mozlz4 |
| security certificates | cert9.db |
| site specific preferences | permissions.sqlite |

## List of all important files in alphabetically order

```
cert9.db
cookies.sqlite
favicons.sqlite
key4.db
logins.json
permissions.sqlite
places.sqlite
search.json.mozlz4
```

# Link

* [Recovering important data from an old profile](https://support.mozilla.org/en-US/kb/recovering-important-data-from-an-old-profile) - 20200826
