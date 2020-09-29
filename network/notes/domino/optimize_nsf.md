# Optimize a nsf database

* Check that you have designer or manager access to this database
* `File` -> `Application` -> `Properties`
* When creating a new database, click on the `advanced` button
* Enable as many a possible from the following list
    * basic tab
        * display images after loading (speed)
    * advanced tab
        * don't maintain unread marks (disk space)
        * optimize document table map (speed)
        * don't overwrite free space (speed)
        * don't support specialized response hierachy (disk space)
        * don't hallow headline monitoring (speed)
        * don't allow simple search (speed)
        * limit entries in $updatedBy fileds (disk space)
        * limit entries in $revisions fileds (disk space)
        * compress database design (disk space)
        * compress document data (disk space)
        * use domino attachment and object service (disk space)
* Disable as many a possible from the following list
    * basic tab
        * allow use of stored forms in this database (disk space)
        * maintain lastaccessed property (speed)
* If you make any changes of the following properties, you have to compact the database
    * don't maintain unread marks
    * optimize document table map
    * don't support specialized response hierarchy
    * use domino attachment and object service
    * move views out of database

# Link

* [Setting database properties that optimize database performance](https://help.hcltechsw.com/domino/10.0.1/tune_settingdatabasepropertiesthatoptimizedatabaseperfor_t.html) - 20200929
