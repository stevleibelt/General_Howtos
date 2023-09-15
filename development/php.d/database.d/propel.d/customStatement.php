<?php

use Propel\Runtime\Propel;

//use custom sql query
$connection = Propel::getConnection();
$sqlStatement = 'Select * FROM `my_table` WHERE `foo` = \'bar\'';
$statement = $connection->prepare($sqlStatement);
$statement->execute();
$resultArray = $statement->fetchAll(PDO::FETCH_ASSOC);

foreach ($resultArray as $resultRow) {
    //do your stuff
}
