# create or update is easy with propel

```php
$myObject = MyPropelTableQuery::create()
    ->filterByFoo('bar')
    ->filterByBar('foo')
    ->findOneOrCreate();  //will return MyPropelTable object

echo $myObject->getFoo();   //outputs 'bar'
echo $myObject->getBar();   //outputs 'foo'
```

# links

* [propel reference](http://propelorm.org/reference/model-criteria.html#creating-an-object-based-on-a-query)
