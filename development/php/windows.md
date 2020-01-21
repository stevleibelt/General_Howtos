# How to load an extension

* open your php.ini
* define `extension_dir` (path has to be relative to where you make the call
* call php and use you php.ini

## Example

Given is the following directory structure.

```
<project root path>
    <library>
        <php>
    	    <ext>  //contains the extensions
	    php.ini
    <source>
        <bin>
	    my_task.php
```

The php.ini `extension_dir` has the value `./library/php/ext`.

The ini setting will work if you call php the following way within a minigw64 shell.

```
./library/php/php.exe -c library/php/php.ini source/bin/my_task.php
```

# Links

* [PHP For Windows](https://windows.php.net/download/)
