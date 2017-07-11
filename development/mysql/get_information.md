# Display general information

```mysql
-- 
-- for all tables of that database
-- 

SHOW TABLE STATUS

-- 
-- for a dedicated table
-- \G is to show full data not only a partial
-- 

SHOW TABLE STATUS LIKE '<table name>'\G
```

# Show more information since MySQL 5.6

```mysql
-- 
-- run ANALYZE to get the most up-to-date information
-- ANALYZE updates the mysql.innodb_index_stats for the given table
-- ANALYZE can result in heavy load on your system
-- "During the analysis, the table is locked with a read lock for InnoDB and MyISAM."
-- @link:https://dev.mysql.com/doc/refman/5.7/en/analyze-table.html
-- 

ANALYZE table <table_name>;

SELECT
       sum(stat_value) pages,
       index_name,
       sum(stat_value) * @@innodb_page_size size
FROM
       mysql.innodb_index_stats
WHERE
           table_name = '<table_name>'
       AND database_name = '<database_name>'
       AND stat_description = 'Number of pages in the index'
GROUP BY
       index_name;
```

# link

* http://aadant.com/blog/2014/02/04/how-to-calculate-a-specific-innodb-index-size/
