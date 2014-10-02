# howto

    # example is working with a mysql
    cd path/where/schema.xml/should/be/placed
    # create a basic build.properties
    echo “propel.project = my_application\npropel.database = mysql\npropel.database.url = mysql:dbname=<database name>\npropel.database.user= <user name>” > build.properties
    #   propel.project
    ./relative/path/to/root/vendor/bin/propel-gen reverse “mysql:host=localhost;db=<database name>;user=<user name>;password=<password>”


# links

* [propel1](http://propelorm.org/Propel/cookbook/working-with-existing-databases.html)
* [propel2](http://propelorm.org/documentation/cookbook/working-with-existing-databases.html)
