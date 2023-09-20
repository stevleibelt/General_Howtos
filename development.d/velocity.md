# velocity  - apache template engine

## variables

* alphabetic (a .. z, A .. Z)
* numeric (0 .. 9)
* hyphen ("-")
* underscore ("\_")

```
$foo
${foo}
$!foo
$!{foo}
```

## object properties

```
$foo.bar
${foo.bar}
```

## methods

```
$foo.bar()
${foo.bar()}
$foo.setBar("foobar")
```

## directives

```
#set($foo = $bar)
#set($foo.bar = 'foobar')
#set($foo.bar = $bar.foo)
#set($foo.bar = $bar.foo($baz))
#set($foo.bar = 123)
#set($foo.bar = [1..3])
#set($foo.bar = ["there", "is", "no", "foo", "without", "a", "bar"])
#set($foo.bar = {"there" : "is", "no" : "foo", "without" : "a bar"})
```

## conditions

* and = &&
* or = ||
* not = !

```
#if ($foo == $bar)it is true#{else}it is false#end
#if ($foo == $bar)
    it is true
#{elseif ($foo == $baz)
    it is in between
#{else}
    it is false
#end
```

## loops

```
#foreach ($item in $items)
    $item
#end

#foreach ($item in [1..3])
    $item
#end

#foreach ($item in ["there", "is", "no", "foo", "without", "a", "bar"])
    $item
#end
```

## comments

```
## single line comment

#*
multi
line
comment
*#
```

## render but do not parse

```
## $bar contains "$foo"

#set( $bar = '$foo')

## escape

\$foo

## big block of not parsed code

#literal()
#foreach ($foo in $bar)
nothing will happen to $foo
#end
#end

#[[
    #if
    #set($foo = 'bar')
]]#
```

## hints

```
$foo.getBar()
## is the same as
$foo.Bar

$data.setUser("jon")
## is the same as
#set( $data.User = "jon" )

$data.getRequest().getServerName()
## is the same as
$data.Request.ServerName
## is the same as
${data.Request.ServerName}
```

## debug

```
## cast to string

$foo.toString()

## getting strange hash-values? maybe you a are working with an array

StringUtils.join($foo, ", ")
```

# links

* [syntax](http://velocity.apache.org/engine/devel/vtl-reference-guide.html)
* [syntax compared to jsp](http://www.caucho.com/resin-3.1/doc/jsp-velocity.xtp)
* [start up velocity](http://www.javaworld.com/article/2075966/core-java/start-up-the-velocity-template-engine.html?page=2)
* [wiki](http://wiki.apache.org/velocity/)
* [wikipedia entry](https://en.wikipedia.org/wiki/Apache_Velocity)
* [coding standards](http://wiki.apache.org/velocity/CodeStandards)
* [stillness - Extraction template engine with the same syntax as Apache Velocity](https://github.com/cbrisson/stillness)
* [user guid](https://velocity.apache.org/engine/releases/velocity-1.5/user-guide.html)
* [blogpost about velocity on javaworld.com](http://www.javaworld.com/article/2075966/core-java/start-up-the-velocity-template-engine.html?page=3)
