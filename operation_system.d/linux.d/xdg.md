# XDG

## What is it

```
User directories are a set of common user directories located within the $HOME directory, including Documents, Downloads, Music, and Desktop. Identified by unique icons within a file manager, they will commonly be automatically sourced by numerous programs and applications.
```

## Available tools

### xdg-mime

Script for directly querying and modifying default MIME applications.

```
#Usage
##Find a mime type by query the file type of an existing file
##  e.g. a pdf file
xdg-mime query filetype my/path/to/the/file.pdf
##  results in >>application/pdf<<

##Find the default application for that MIME type
xdg-mime query default application/pdf

##Set the default application for that MIME type
xdg-mime default mupdf.desktop application/pdf

##If you want to run the query in debug mode
env XDG_UTILS_DEBUG_LEVEL=10 xdg-mime query default application/pdf
```

### xdg-open

Resource opener used by many applications.

### xdg-settings

Ease up configuring all your MIME types for a single application.

## How to define your own rules

```
cat > ~/.config/user-dirs.dirs <<DELIM
# This file is written by xdg-user-dirs-update                                                                                                                                                                                                                                                                          
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
#
XDG_DESKTOP_DIR="$HOME/"
XDG_DOWNLOAD_DIR="$HOME/temporary/download"
XDG_TEMPLATES_DIR="$HOME/document/template"
XDG_PUBLICSHARE_DIR="$HOME/"
XDG_DOCUMENTS_DIR="$HOME/document"
XDG_MUSIC_DIR="$HOME/"
XDG_PICTURES_DIR="$HOME/"
XDG_VIDEOS_DIR="$HOME/"
DELIM
```

## Links

* [xdg-utils: wiki.archlinux.org](https://wiki.archlinux.org/title/Xdg-utils) - 20221229
* https://wiki.archlinux.org/index.php/Xdg_user_directories
* http://pastebin.com/0fmRWPZA
* http://unix.stackexchange.com/questions/37922/how-to-prevent-the-auto-creation-of-the-desktop-folder
