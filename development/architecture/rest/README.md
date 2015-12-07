# REST

Each ressource is associated with an url.

# General

* try to separate "view" (frontend or easy readable and rememberable) url from service urls (with query parameters)
    * view: "/service/blog/entries/archive/2011/08/04"
    * service: "/service/blog/entries/archive/?year=2011&month=08&day=04"
* views should gernally only accept HTTP GET (POST from time to time)
* by simple, be consistent (especially for the point of returning collection of data or collection of urls pointing each to the data), never mix up
* testing of web services is critical, let the tests be exhaustive and extensive


# HTTP Methods explained with SQL commands

While sql commands manipulating tables and rows, http methods manipulating resources.
Taken from [0].
Always return an error instead of try to response something "half done".

## DELETE (SQL: DELETE)

* used to delete data
* if a url like '/service/blog/entries/archive' implements DELETE, all entries are deleted on a call
* implement DELETE only on a single entity resource (or if you know what you are doing)
* query parameters are the WHERE parameters in sql

## GET (SQL: SELECT)

* used to retrieve data 
* query parameters are the WHERE parameters in sql
* if query parameters are used, a selection of items should be returned

## POST (SQL: STORED PROCEDURES)

* used to send data or to generate data (calculation for example)
* the name of the ressource has no impact of the number of data sets which are manipulated

## PUT (SQL: INSERT)

* create or replace data associated with an url

# Books

* [0] Ajax and REST recipes - apress

# Links

* http://williamdurand.fr/2015/06/02/video-nobody-understands-rest/
