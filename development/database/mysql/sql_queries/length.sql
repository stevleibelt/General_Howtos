-- get length of a string
-- available are "bit_length", "character_length", "octet_length" and "length"

Select 
  `my_column`, character_length(`my_column`) AS `length_of_my_column` 
FROM 
  `my_table` 

