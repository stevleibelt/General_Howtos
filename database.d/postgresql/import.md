# import from file

```
#-a - echo all input from script
psql -U <user name> -d <my database> -a -f <my file path>
```

# disable foreign key checks

```
BEGIN;
ALTER TABLE <my table> DISABLE TRIGGER ALL;
-- now the RI over table b is disabled
ALTER TABLE <my table> ENABLE TRIGGER ALL;
COMMIT;
```
