# get last executed query

```php
$connection = Propel::getConnection();
if ($connection instanceof DebugPDO) {
    $query = $connection->getLastExecutedQuery();
}
```

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

# how to write complex queries

If they are to special and pure relational, do not use propel but PDO instead.
If the where and join parts are very long or complicated, try to use formatter objects

```mysql
--- find all the books not reviewed by :name
SELECT * FROM book
WHERE 
    id NOT IN (
        SELECT book_review.book_id 
        FROM book_review
            INNER JOIN author ON (book_review.author_id=author.ID)
        WHERE author.last_name = :name
        );
```

Filter between minimum and maximum values.

```php
/**
 * see: http://propelorm.org/reference/model-criteria.html#generated-query-methods
 */
FooQuery::create()
    ->filterByBar(
        array(
            'min' => 23,
            'max' => 42
        )
    )
    ->find();
```
Upper php code will create following mysql statement.

```mysql
SELECT * 
FROM `foo` 
WHERE `bar` >= 23 AND `bar` <= 42;
```


```php
//prepare and execute an arbitrary SQL statement
$con = Propel::getConnection(BookPeer::DATABASE_NAME);
$sql = 'SELECT * 
        FROM book 
        WHERE id NOT IN (
            SELECT book_review.book_id 
            FROM book_review 
                INNER JOIN author ON (book_review.author_id=author.ID) 
            WHERE author.last_name = :name)';
$stmt = $con->prepare($sql);
$stmt->execute(array(':name' => 'Austen'));

//hydrate Book objects with the result
$formatter = new PropelObjectFormatter();
$formatter->setClass('Book');
$books = $formatter->format($stmt);
```
If the query is to long, try to split it up by writing small "filterBy" methods and chain this methods.
If you need more than one query, use the "useFooQuery" method.

# links

* http://propelorm.org/reference/model-criteria.html
* http://propelorm.org/blog/2011/02/02/how-can-i-write-this-query-using-an-orm-.html
