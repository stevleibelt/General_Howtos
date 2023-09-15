# how does a query behave if you clone it?

```php
$query = MyQuery::create()
    ->filterById(__LINE__);

echo $query->toString() . PHP_EOL;

$query = clone $query;

echo $query->toString() . PHP_EOL;
```

# how to use "clear[ForeignTableEntries]" methods?

* what is "resetPartial[...]" good for?
* what is "init[...]" good for?
* what is "clearAllReferences" good for?
