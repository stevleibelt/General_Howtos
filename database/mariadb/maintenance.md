# MariaDB Maintenance and performance tuning guide

* Use [MySQLTuner-perl](https://github.com/major/MySQLTuner-perl) to generate a report
* Gain knowledge about your system by using [mariadb-sys](https://github.com/FromDual/mariadb-sys)
* Use `sudo mysql_upgrade` each time you upgrade your database
* Try to setup a cron job/systemd timer that runs `optimize table` on your most used tables

## Find tables with unused space

```
SELECT
    CONCAT(`table_schema`, '.', `table_name`) AS 'TABLE_SCHEMA_NAME',
    round(data_length/1024/1024) AS 'DATA_LENGTH_IN_MB',
    round(data_free/1024/1024) AS 'DATA_FREE_IN_MB'
FROM
    `information_schema`.`tables`
WHERE
    round(data_free/1024/1024) != round(data_free/1024/1024)
--    `table_schema`='<schema name>'
ORDER BY
    `data_free` DESC;
```
