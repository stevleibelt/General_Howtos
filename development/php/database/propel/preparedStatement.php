<?php

use Propel\Runtime\Propel;

//use custom sql query
$connection = Propel::getConnection();
$sqlStatement = 'Select * FROM `my_table` WHERE `foo` = :foo';
$statement = $connection->prepare($sqlStatement);
$statement->execute(array(':foo' => 'bar'));
