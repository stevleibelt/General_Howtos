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

# Calculate the size and the free space for OPTIMIZE

```mysql
-- 
-- @see: https://ma.ttias.be/mysql-calculate-free-space-ibd-files/
--
SELECT round((data_length+index_length)/1024/1024,2)
FROM information_schema.tables
WHERE
  table_schema='<database_name>'
  AND table_name='<table_name>';
-- return value of 1000 is 1GB
```

Next is to go to your directory and search for the <table_name>.ibd file.
Compare this size with the size of the query and you can calculate how much space you can gain by an "OPTIMIZE TABLE <table_name>".

# Show more information since MySQL 5.6

```mysql
-- 
-- run ANALYZE to get the most up-to-date information
-- ANALYZE updates the mysql.innodb_index_stats for the given table
-- ANALYZE can result in heavy load on your system
-- "During the analysis, the table is locked with a read lock for InnoDB and MyISAM."
-- @link https://dev.mysql.com/doc/refman/5.7/en/analyze-table.html
-- @link https://dzone.com/articles/mysql-optimizer-analyze-table
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

# Show Size of all Index of one Table

```mysql
SELECT 
    database_name, 
    table_name, 
    index_name, 
    stat_name, round(stat_value*@@innodb_page_size/1024/1024, 2) size_in_mb
FROM 
    mysql.innodb_index_stats
WHERE 
    stat_name="size" 
    AND table_name = '<table name>'
ORDER BY 
    4 DESC;
```

# Show Statistics Size of Index

```mysql
-- show statistics of primary index
SELECT 
    database_name, 
    table_name, 
    index_name, 
    round(stat_value*@@innodb_page_size/1024/1024, 2) size_in_mb
FROM 
    mysql.innodb_index_stats
WHERE 
    stat_name = 'size' 
    AND index_name = 'PRIMARY'
ORDER BY 
    4 DESC;
```

# Show information about data fragmentation of the tables

```mysql
SELECT
    ENGINE,
    TABLE_NAME,
    ROUND(DATA_LENGTH / 1024 / 1024) AS data_length,
    ROUND(INDEX_LENGTH / 1024 / 1024) AS index_length,
    -- data_free is the important one since this is the allocated space that is not used (because of deletion)
    ROUND(DATA_FREE / 1024 / 1024) AS data_free
FROM
    information_schema.tables
WHERE
    DATA_FREE > 0
ORDER BY 
    data_free DESC;
```

# link

* http://aadant.com/blog/2014/02/04/how-to-calculate-a-specific-innodb-index-size/
* http://oysteing.blogspot.de/2011/05/innodb-persistent-statistics-save-day.html
* https://dzone.com/articles/mysql-optimizer-analyze-table
