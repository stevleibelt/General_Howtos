-- 
-- replace broken german umlauts
-- https://mariobrandt.de/archives/technik/mysql-utf-8-fix-umlaute-603/
-- 

UPDATE `table` set
    `column`= REPLACE(`column`,"ÃŸ", "ß"),
    `column`= REPLACE(`column`, "Ã¤", "ä"),
    `column`= REPLACE(`column`, "Ã¼", "ü"),
    `column`= REPLACE(`column`, "Ã¶", "ö"),
    `column`= REPLACE(`column`, 'Ã„', 'Ä'),
    `column`= REPLACE(`column`, "Ãœ", "Ü"),
    `column`= REPLACE(`column`, "Ã–", "Ö"),
    `column`= REPLACE(`column`, 'â‚¬', '€');
