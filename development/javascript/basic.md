# if is undefined

    if (myVariable === undefined) {
    }

# if is a function

    if (typeof callback === "function") {
    }

# default value

    function foobar(foo)
    {
        var foo = foo || 'bar';
        //...
    }

# switch

    switch (expression) {
        case foo:
            doFoo();
            [break;]
        default:
            doDefault();
            [break;]
    }

# string

## indexOf

    var myString = 'BarFoo';

    myString.indexOf('Foo');    //3

## lastIndexOf

    var myString = 'BarFooFoo';

    myString.indexOf('Foo');    //6

## rexEx

    var myString = 'BarFoo';

    console.log(myString.match(/^Bar/));    //true - starts with Bar
    console.log(myString.match(/Foo$/));    //true - ends with Foo
