# naming

```php
//--------
//1. public members should be named using just their member name, like so:
//--------

class Foo {
    public $bar;

    public function __sleep() {
        return array("bar");
    }
}

//--------
//2. protected members should be named using "\0" . "*" . "\0" . member name, like so:
//--------

class Foo {
    protected $bar;

    public function __sleep() {
        return array("\0*\0bar");
    }
}

//--------
//3. private members should be named using "\0" . class name . "\0" . member name, like so:
//--------

class Foo {
    private $bar;

    public function __sleep() {
        return array("\0Foo\0bar");
    }
}
```

[source](http://php.net/manual/de/language.oop5.magic.php#81492)
