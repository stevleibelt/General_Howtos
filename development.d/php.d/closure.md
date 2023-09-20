# closures

## simple

    function ([$argument_one[, $argument_two[, ...]]]) { //@TODO }

## scoped

Scoping means inherit variable from the parent scope (in which the closure was declared, not where it is called!).

    function ([$argument_one[, $argument_two[, ...]]]) use ([$variable_one[, $variable_two[, ...]]]) { //@TODO }

## assigned to a variable

    $foo = function ($bar) { echo $bar; }
    $foo('bar');

# links

* http://www.php.net/manual/en/functions.anonymous.php

# tags

* closure
* anonymous function
* callback
