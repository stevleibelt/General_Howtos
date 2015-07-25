# BREAD

* browse
* read
* edit
* add
* delete

# notes

* dealing with collections is the mindset when using bread
* threating entity collections as a first-class concern
* patters dealing with bread
    * [table data gateway](http://martinfowler.com/eaaCatalog/tableDataGateway.html)
        * one object that acts as a gateway to the database table
        * one instance handles all the rows in the table
    * [table module](http://martinfowler.com/eaaCatalog/tableModule.html)
        * one instance that handles the business lgic for all rows in a database table or a view
    * [data mapper](http://martinfowler.com/eaaCatalog/dataMapper.html)
        * a layer of mappers that moves data between objects and a database while keeping them independent of each other and the mapper itself
