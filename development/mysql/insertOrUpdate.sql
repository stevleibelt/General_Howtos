INSERT INTO my_table 
(column_one, column_two) 
VALUES 
(1, 2) 
ON DUPLICATE KEY UPDATE 
column_two=2, updated_at=NOW();
