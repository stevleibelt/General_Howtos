# example

```
var modules = {};

(function (root) {
    var info = 'hello world';

    root.myMethod = function() {
        return info;
    }
})(modules);
```
