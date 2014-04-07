# join

```php
$query = TableOneQuery::create();
$query->useTableTwo()
    ->filterByFoo('Bar')
->endUse()
->findOne();
```

```mysql
SELECT * 
FROM `table_one` 
INNER JOIN `table_two`
    ON (`table_one`.`id` = `table_two`.`table_one_id`)
WHERE `table_two`.`foo` = 'Bar';
```

# links

* http://propelorm.org/reference/model-criteria.html
