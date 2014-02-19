<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-02-18
 */

use Propel\Runtime\Propel;

$connection = Propel::getConnection();
$sql = 'SELECT * FROM my_custom_select';
$statement = $connection->prepare($sql);
$statement->execute();

$formatter = new PropelObjectFormatter();
$formatter->setClass('MyCustomSelect');
$myCustomSelects = $formatter->format($statement);

//myCustomSelects is MyCustomSelect[]-Collection
