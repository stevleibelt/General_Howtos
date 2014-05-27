# create root

```php
$path = 'foo';
$permissions = 0755;
$root = vfsStream::create($path, $permissions);
```

# create directory

```php
//assuming that $root exists
$name = 'bar';
$directory = vfsStream::newDirectory($name);
$root->addChild($directory);
```

# create file

```php
//assuming that $root exists
$name = 'bar';
$file = vfsStream::newFile($name);
$root->addChild($file);
```
# create file in directory

```php
//assuming that $root exists
$directory = vfsStream::newDirectory('foo');
$file = vfsStream::newFile('bar');
$directory->addChild($file);
$root->addChild($directory);
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
