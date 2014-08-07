# create root

```php
$path = 'foo';
$permissions = 0755;
$root = vfsStream::setup($path, $permissions);
```

# create directory

```php
//assuming that $root exists
$name = 'bar';
$directory = vfsStream::newDirectory($name);
$root->addChild($directory);

//get directory path
echo $directory->url();
```

# create file

```php
//assuming that $root exists
$name = 'bar';
$file = vfsStream::newFile($name);
$root->addChild($file);

//get file path
echo $file->url();
```
# create file in directory

```php
//assuming that $root exists
$directory = vfsStream::newDirectory('foo');
$file = vfsStream::newFile('bar');
$directory->addChild($file);
$root->addChild($directory);

//get file path
echo $file->url();
```

# dump structure

```php
echo var_export(
    vfsStream::inspect(
        new vfsStreamStructureVisitor()
    )->getStructure(),
    true
);
```

# links

* https://github.com/mikey179/vfsStream/wiki
* http://tech.vg.no/2011/03/09/mocking-the-file-system-using-phpunit-and-vfsstream/
* http://blog.sebastiankleine.de/vfsstrem-with-phpunit/
