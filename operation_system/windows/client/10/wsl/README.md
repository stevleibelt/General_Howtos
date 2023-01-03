# WSL

WSL is the short name for **W**indows **S**ubsystem for **L**inux.

A [setup guide for debian](setup.md) is available in this section.

## Where are the files stored?

Given is that you have installed a pure debian.

`C:\Users\$user\AppData\Local\Packages\TheDebianProject.DebianGNULinux_$unique-id`

You can access all files for all wsl managed virtual machines by entering `\\wsl$` in your Microsoft Windows Explorer.   
If you use something like `git bash` on windows, you can gain access by using the path `//wsl$`.

## Error solving

### 1.) On Debian: Cannot make directory '/var/run/screen': Permission denied

### 1.) Error

Every time you want to execute `screen`, you get the following error message.

```bash
Cannot make directory '/var/run/screen': Permission denied
```

### 1.) Solution

Add the following line to a fitting bash environment file.


```bash
export SCREENDIR="$HOME/.screen"
```

### 1.) Links

* [Fix Screen Permissions Issue on Windows10 WSL](https://gist.github.com/ahmetozer/c79ef07407be4fe3cf494be59f6ec598) - 20230103
* [Cannot make directory '/var/run/screen': Permissions denied](https://superuser.com/questions/1195962/cannot-make-directory-var-run-screen-permission-denied) - 20220103

