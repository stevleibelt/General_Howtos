# check if it is a object

if (typeof myTestableObject === 'object') {
    console.log('is a object');
} else {
    console.log('is not object');
}

# check if object has function

myObject.hasProperty('property string');
myObject.hasOwnProperty('property string');

# summaray

* private variables are declared with the 'var' keyword inside the object, and can only be accessed by private functions and privileged methods.
* private functions are declared inline inside the object's constructor (or alternatively may be defined via var functionName=function(){...}) and may only be called by privileged methods (including the object's constructor).
* privileged methods are declared with this.methodName=function(){...} and may invoked by code external to the object.
* public properties are declared with this.variableName and may be read/written from outside the object.
* public methods are defined by Classname.prototype.methodName = function(){...} and may be called from outside the object.
* prototype properties are defined by Classname.prototype.propertyName = someValue
* static properties are defined by Classname.propertyName = someValue

take from http://phrogz.net/JS/classes/OOPinJS.html
