# json

alert(JSON.stringify(myObjectOrVar));

var responseObj = jQuery.praseJSON(response);

# find

$(this).find('img') -> list of all img's
$('img', this); -> same as above
$(this).children('img:first'); -> first img found
$(this).children()[0];
$(this).next() -> next img

function default value
function test(paramA) {
	paramA = paramA || 'default';
}

# inArray - is in array
jQuery.inArray(value, array);

//create a class
function MyClass {
	this.myFunction = function(parameter1)
	{
		return parameter1
	}
}
MyClass.myFunction('foo');

# check if find returns anything

myElement = jQuery.find('my-selector');

if (myElement.length === 0) {
    console.log('no element found for my-selector');
}
