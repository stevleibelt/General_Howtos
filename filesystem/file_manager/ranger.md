# Ranger

Ranger is a vi like file manager for the command line.

## Commands

* k         - up
* j         - down
* h         - left
* l         - right
* space     - select a item
* V         - visual mode to select items
* v         - inverts selected items
* gg        - jump to the top
* G         - jump to the bottom
* zh        - toggle to show hidden items
* /         - start a search
* :filter   - limit item matchings
* :delete   - delete selected items

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

* http://www.rosipov.com/blog/ranger-the-cli-file-manager/
* https://wiki.archlinux.org/index.php/ranger

