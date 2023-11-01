# Ranger

Ranger is a vi like file manager for the command line.

## Commands

| Keystroke | Description |
| --- | --- |
| F4 | Open the file in your editor |
| k | Move up |
| j | Move down |
| h | Move left |
| l | Move right |
| i | Displays information about the file or open it |
| dd | Cut file |
| yy | Yank (copy) file |
| cw | Rename file |
| r | Open file |
| u | Undo |
| space | Select a item |
| dD | Delete a file |
| z | Change settings |
| V | Visual mode to select items |
| v | Inverts selected items |
| gg | Jump to the top |
| G | Jump to the bottom |
| zh | Toggle to show hidden items |
| / | Start a search |
| :delete | Delete selected items |
| :filter | Limit item matchings |
| :mkdir <string: directoryname> | Creates a directory |
| :openwith | Opens a file with a given program |
| :shell | Run a command in a shell |
| :touch <string: filename> | Creates a file |

## Image preview

* Install `ueberzug`
* `echo 'set preview_images true' > ${HOME}/.config/ranger/rc.conf`
* `echo 'set preview_images_method ueberzug' > ${HOME}/.config/ranger/rc.conf`

## Good to know

### Generate configuration files

```
#generate files in ~/.config/ranger
ranger --copy-config=all
```

## Links

* [Manage your files in your Linux terminal with ranger](https://opensource.com/article/22/7/manage-files-linux-terminal-ranger) - 20220704T14:19:10
* [Ranger - archlinux](https://wiki.archlinux.org/index.php/ranger) - 2017T13:21:00
* [Ranger - the CLI filemanager](http://www.rosipov.com/blog/ranger-the-cli-file-manager/) - 20150208T22:10:20

