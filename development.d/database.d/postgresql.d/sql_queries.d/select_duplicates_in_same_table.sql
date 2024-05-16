-- 
-- Find/Select duplicates in the same table
-- ref: https://database.guide/4-ways-to-find-duplicate-rows-in-mysql/
-- 

-- 
-- This is by fare the best since it gives you the freedom to fetch all rows without duplicating the row names
-- 

WITH cte AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER (
        PARTITION BY column_one, column_two
        ORDER BY column_one, column_two
      ) AS rn
    FROM my_table
    -- Add optional WHERE clause here
  )
SELECT * FROM cte WHERE rn <> 1;

-- 
-- As example a more traditional statement
-- 

SELECT
  column_one,
  column_two,
  COUNT(*) AS number_of_rows
FROM
  my_table
-- Add optional WHERE clause here
GROUP BY
  column_one,
  column_two
HAVING COUNT (*) > 1;
