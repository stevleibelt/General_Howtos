# example

```
function ExtendedObject(parameterOne, parameterTwo) {
    var self = this;

    ParentObject.call(this, parameterOne, parameterTwo);

    var parentMethod = self.myMethod;

    self.myMethod = function(parameterOne) {
        return parentMethod(parameterOne) + ' its me';
    }
}
```
