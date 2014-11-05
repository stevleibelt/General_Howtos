-- 
-- select row with most recent date per user
-- see
--  http://stackoverflow.com/questions/17038193/select-row-with-most-recent-date-per-user
--  http://dev.mysql.com/doc/refman/5.0/en/example-maximum-column-group-row.html
-- 

SELECT 
    login_data.*
FROM
    (
        SELECT 
            `login`.`user_id` AS `user_id`
            MAX(`login`.`last_login`) AS `last_login`
        FROM
            `login`
        GROUP BY
            `login`.`user_id`
    ) AS highest_login
    JOIN (
        SELECT 
            * 
        FROM
            `login`
    ) AS login_data
        ON (
            highest_login.user_id = login_data.user_id
            AND highest_login.last_login = login_data. last_login
        );
