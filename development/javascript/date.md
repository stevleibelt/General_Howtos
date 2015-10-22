# Get Day, Month and Year

```
var today   = new Date();

var day     = today.getDate(); //getDay returns current weekday [0-6]
var hours   = today.getHours();
var minutes = today.getMinutes();
var month   = today.getMonth() + 1; //getMonth starts with 0
var seconds = today.getSeconds();
var year    = today.getFullYear();

alert('date:: ' + year + '-' + month + '-' + day);

if (month < 10) {
    month = '0' + month;
}
if (day < 10) {
    day = '0' + day;
}

alert('date:: ' + year + '-' + month + '-' + day);
```

# links

* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date
