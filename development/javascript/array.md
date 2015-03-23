# Simple Array

```javascript
var myArray = new Array();
myArray["key"] = "value";

var myArray = newArray("value1", "value2);

var myArray = {
  "key1": "value1", 2: "value2"
}
```

# Is in Array

```javascript
#http://www.w3schools.com/jsref/jsref_indexof_array.asp
#https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf
#indexOf returns -1 if no index was found
var isInArray = array.indexOf(value) >= 0);
```

# Array Key Exists

```javascript
array.hasOwnProperty(key);
#or
key in array
```

# Add to Array

```javascript
#http://stackoverflow.com/questions/1996747/add-new-value-to-an-existing-array-in-javascript
array.push(value)
#or if you have a unique index
array[index] = value;
```

# Remove from Array

```javascript
#http://stackoverflow.com/questions/5767325/remove-specific-element-from-an-array
var index = array.indexOf(value);
array.splice(index, 1);
```

# links

* http://blog.programmingsolution.net/javascript/javascript-add-array-to-array/
* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
