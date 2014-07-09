-- 
-- http://dev.mysql.com/doc/refman/5.5/en/charset-convert.html
-- 

-- convert() convertes data between different character sets
-- CONVERT(expr USING transcoding_name)

SELECT CONVERT(_latin1'Müller' USING utf8);
INSERT INTO utf8table (utf8column)
    SELECT CONVERT(latin1field USING utf8) FROM latin1table;
    CONVERT(... USING ...) is implemented according to the standard SQL specification.

-- cast() convertes a string to a diffreent character set
-- CAST(character_string AS character_data_type CHARACTER SET charset_name)

SELECT CAST(_latin1'test' AS CHAR CHARACTER SET utf8);

-- or

SELECT CAST(_latin1'test' AS CHAR CHARACTER SET utf8) COLLATE utf8_bin;
