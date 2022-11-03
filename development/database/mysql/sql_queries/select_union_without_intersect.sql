-- 
-- Select rows that are in both queries without overlapping
-- Hints:
--  Use CTE/Common Table Expressions if possible to speed up the queries when dealing with larger tables
-- @see: https://www.percona.com/blog/set-theory-in-mysql-8-0-union-and-now-intersect-and-except/ - 20221103
-- 

-- Using except
-- What we want to achive:
--  Result set of first query without result set of second query by using except
--  Result set of second query without result set of first query by using except
--  Combine both result sets by using union
(
  SELECT
    first_column, second_column
  FROM
    first_table
  EXCEPT
  SELECT
    first_column, second_column
  FROM
    second_table
)
UNION
(
  SELECT
    first_column, second_column
  FROM
    second_table
  EXCEPT
  SELECT
    first_column, second_column
  FROM
    first_table
)

-- Using
-- What we want to achive:
--  Result set of first query with combined result set of second query by using union
--  Result set of only the overlapping rows from the first and the second query by using intersect
--  Slice out the second result set from the first result set by using except
(
  SELECT
    first_column, second_column
  FROM
    first_table
  UNION
  SELECT
    first_column, second_column
  FROM
    second_table
)
EXCEPT
(
  SELECT
    first_column, second_column
  FROM
    first_table
  INTERSECT
  SELECT
    first_column, second_column
  FROM
    second_table
)

