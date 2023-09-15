# general

As usual, strings are an array starting with position 0.

# get character by postion in string

    var string = 'foobar';

    console.log('character on position 3');
    console.log(string.charAt(3));  // output 'b'

# get position of character in string

    var string = 'foobar';

    console.log(string.indexOf('bar')); // output 3
    console.log(string.indexOf('baz')); // output -1

# get last position of character in string

    var string = 'foobar';

    console.log(string.lastIndexOf('o')); // output 2

# validates if string contains substring

Can deal with regExp also.

    var string = 'there is no foo without a bar'

    console.log(string.match('foo')); // output ["foo"]
    console.log(string.match('baz')); // output null

# replace string in string

Can deal with regExp also.

    var string = 'there is no foo without a bar'
    var newString = string.replace('no', 'never a');

    console.log(newString); // output "there is never a foo without a bar"

# search string in string

    var string = 'foobar is foobar but barfoo is baz';

    console.log(string.search('but'));  // 17
    console.log(string.search('fufu'));  // -1

Can deal with regExp also.

    //@todo

# concat

    var firstName = 'Max';
    var name = firstName.concat(' Power');

    console.log(name);  // output 'Max Power'

# slice

    var name = 'Max Power';
    var firstName = name.slice(0,3); // slice(<from>,<to>);

    console.log(firstName); // output "Max"

# split

    var name ='Max Power; John Rambo; Mr. Messerschmidt';
    var names = name.split('; ');

    console.log(names); // ["Max Power", "John Rambo", "Mr. Messerschmidt"]

# substr and substring

    //substr(<start>, <length>);
    //substring(<start>, <end>);
    var string = 'there is no foo without a bar'

    console.log(string.substr(12, 3));  // foo
    console.log(string.substring(12, 3));  // re is no
    console.log(string.substring(string.length - 3));  // bar

# links

* http://www.mediaevent.de/javascript/Javascript-String-Methoden.html
