# join

## simple inner join

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

## multiple inner join on same table with different columns

```php
$query = TableOneQuery::create();
$query->filterByFoo('foobar');
$query->useTableTwoQuery('table_two_columne_one')
    ->filterByColumnOne('bar')
->endUse();
$query->useTableTwoQuery('table_two_columne_two')
    ->filterByColumnTwo('baz')
->endUse();
```

```mysql
SELECT *
FROM `table_one` 
INNER JOIN `table_two` AS `table_two_column_one`
    ON (`table_one`.`id` = `table_two_column_one`.`table_one_id`)
INNER JOIN `table_two` AS `table_two_column_two`
    ON (`table_one`.`id` = `table_two_column_two`.`table_one_id`)
WHERE `table_one`.`foo` = 'foobar';
    AND `table_two_column_one`.`column_one` = 'bar'
    AND `table_two_column_two`.`column_two` = 'baz'
```

# links

* http://propelorm.org/reference/model-criteria.html
