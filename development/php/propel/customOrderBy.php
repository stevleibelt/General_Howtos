<?php

use Criteria;
use Propel\Runtime\Propel;

//use custom order by

$result = MyQuery::create()
    ->addAsColumn('MAX(My.Column)', 'max_column')
    ->orderBy('max_column', Criteria::DESC)
    ->find();

foreach($result as $my)
{
    echo var_export($my, true) . PHP_EOL;
}
