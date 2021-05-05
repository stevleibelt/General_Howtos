# Setup / Configuration

## General

* If you can install the agent on your client, do so
* If you can use the agent active, do so. Active agent means:
    * The agent buffers the results if the server is not available
    * The client is calling the server which shifting the workload from the server to the client (but just a bit for the client)

## History database tables

The more you keep, the slower the database became. Try to only store important values.
Try to focus on keeping trends.

The importat databasetables here are `history` and `history_uint`.

You can calculate much by just figuring out the "number of processed values per second".
If you monitor 3000 items with a refresh rate of 60 seconds, you are producing 50 values per seconds average (`3000/60`).
If you want to store the data of this 3000 items 30 days, you would end up with 130 million values per 30 days (`30*24*3600*50`).
As a rule of thumb, one value takes 90 bytes storage. With 130 M values, you would end up with around 11 GB.

## Set update interval for a lot of items using SQL

The update interval of an item is written in the database table `zabbix`.`item` and there in the column `delay`.

```
#login to your sql, e.g. using cli mysql
#   use your database `zabbix`

#list all available delays
SELECT `delay` FROM `items` GROUP BY `delay`;

#and now, if you want to set all items with an delay of 1m to an delay of 5m
UPDATE `items` SET `delay` = '5m' WHERE `delay` = '1m';
```

### Links

* [database size](https://www.zabbix.com/documentation/current/manual/installation/requirements#database_size) - 20210423
* [history and trends](https://www.zabbix.com/documentation/current/manual/config/items/history_and_trends) - 20210423
* [Zabbix proxy performance tuning and troubleshooting](https://blog.zabbix.com/zabbix-proxy-performance-tuning-and-troubleshooting/14013/) - 20210505
