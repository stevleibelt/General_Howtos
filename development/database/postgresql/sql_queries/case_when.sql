--
-- Collection of case-when examples in postgresql
--

-- BO: simple case when example
WITH users (name, state) AS (
    VALUES
        ('Detlef Düsseldorf', 'Deutschland'),
        ('Kaja Kopenhagen', 'Dänemark'),
        ('Flora Freiberg', 'Germany'),
        ('Beatrix British', 'United Kingdom')
)
SELECT
    users.name AS user_name,
    users.state AS user_state,
    CASE
      WHEN users.state IN ('Deutschland', 'Germany', 'Bulgarien', 'Dänemark')
        THEN 'yes'
      ELSE
        'no'
    END AS is_eu_citizen
FROM users;
-- EO: simple case when example

