# DATABASE_ALREADY_EXISTS

## Given Is

* You are having an issue with a software like "Salto ProAccess Space".
* You want to install it or reinstall it but this time by migrating an existinc access database into the system.
* You are running the installer and select the right path

## Current Result

* The installer is failing and just telling you "DATABASE_ALREADY_EXISTS"

## Expected Result

* The installer is offering you to replace the existing database.
* Or the installer is showing you what to do

## How to fix it

```
#WIN+R, write "cmd" and hit enter
#the following command should output all known databases
#   salto should be in the list
sqllocaldb info
sqllocaldb stop salto
#following command could result in an error if the database is not shared
sqllocaldb unshare salto
sqllocaldb delete salto
#now the salto database shouldn't be part of the list
sqllocaldb info
```
