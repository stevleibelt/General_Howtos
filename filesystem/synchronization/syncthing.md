# general

* [homepage](http://syncthing.net/)
* [github](https://github.com/syncthing/syncthing)
* [documentation](https://pulse-forum.ind.ie/category/documentation)
    * [getting started](https://pulse-forum.ind.ie/t/getting-started/)
    * [firewalls and port forwards](https://pulse-forum.ind.ie/t/firewalls-and-port-forwards/)
    * [rest interface](https://pulse-forum.ind.ie/t/the-rest-interface/)
    * [feature list](https://pulse-forum.ind.ie/t/what-does-syncthing-sync-and-what-doesnt-it/)
    * [multiple instances on same machine](https://pulse-forum.ind.ie/t/how-to-create-syncthing-test-environments/)
    * [dockerfile](https://pulse-forum.ind.ie/t/dockerfile-for-syncthing/)
* [config](https://pulse-forum.ind.ie/t/config-file-and-directory/) in '$HOME/.config/syncthing/config.xml'
* disable "global discovery"
* [android app available](https://github.com/Nutomic/syncthing-android)

# how to

## enable gui to outside

change

    <gui enabled="true" tls="false">
        <address>127.0.0.1:8080</address>
    </gui>

to (enable tls is optional)

    <gui enabled="true" tls="true">
        <address>0.0.0.0:8080</address>
    </gui>

You should add user name and password for gui authentication as soon as possbile.

## change default directory

change

    <folder id="default" path="/home/<user>/Sync" ro="false" rescanIntervalS="60" ignorePerms="false">

to

    <folder id="default" path="/home/<user>/<your folder path>" ro="false" rescanIntervalS="60" ignorePerms="false">

## excluding files

* put a [.stignore](https://pulse-forum.ind.ie/t/excluding-files-from-synchronization-ignoring/) file into the root of your sharing directory

### patterns

* //                            -   comment (no effect)
* <name or path>                -   regular file name or file paths
* *                             -   zero or more character but not directory separator
* **                            -   zero or more character with directory separator
* ?                             -   single character that is not the directory separator
* /<pattern>                    -   matches in current directory only
* #include <path to named file> -   load patterns from a file
* !<pattern>                    -   negates the pattern (files that are not ignored)
