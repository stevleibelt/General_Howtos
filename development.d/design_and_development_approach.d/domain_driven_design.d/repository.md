# repository

* mechanism between domain model and storage
* encapsulates the logic to persits and fetchs data
* clean separation between domain and data mapping layer
* mimic a collection
* provide domain specific methods to fetch data (no generic criterias)

## notes

* implement method like nextIdentifier()
* implement method like size() (to mimic the collection sense) instead of count()

## querying / specification

* just a predicate taking the domain model
* returns true or false
    * true if domain model is fitting the specification
    * false if domain model is not fitting the specification
* more or less a filter
* can also be a persistence specific specification like a method caled toSqlClause()

## transaction

* transaction is not part of the repository
* a decorator can commit or roll back the changes if something happes
