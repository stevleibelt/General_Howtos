-- 
-- insert with fixed values
-- 

INSERT INTO 
  my_table 
  (column_one, column_two) 
VALUES 
  (1, 2), (3, 2);

-- 
-- insert with where
-- 

INSERT INTO 
  my_table 
  (column_one, column_two) 
VALUES 
  (1, 2), (3, 2)
WHERE 
  column_three = 'foobar';

-- 
-- insert with sub query
-- 

INSERT INTO 
  my_table 
  (one, two) 
  SELECT
     myOne, myTwo
   FROM
     my_other_table 
   WHERE 
     myOne = 'foo';

-- 
-- insert all columns (warning, can lead into trouble if you are dealing with auto increment values)
-- 

INSERT INTO
    `my_table`
    SELECT 
        `backup`.*
    FROM
        `my_backup_tabl` AS `backup`;
