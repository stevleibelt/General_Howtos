# reflection

# examples

## [reset singleton instance](https://coderwall.com/p/tx9cgg/resetting-singletons-in-php-testing-the-untestable)

```php
$singleton = Classname::getInstance(); // no idea what's inside
$reflection = new ReflectionClass($singleton);
$instance = $reflection->getProperty('instance');
$instance->setAccessible(true); // now we can modify that :)
$instance->setValue(null, null); // instance is gone
$instance->setAccessible(false); // clean up

// now recreate a fresh object
$singleton = Classname::getInstance();
```
