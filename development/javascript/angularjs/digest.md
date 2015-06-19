# binding

* $scope.$appliy(function () {});
* $scope.$watch('name', function(newValue, oldValue) {});
* $scope.$watchCollection('name', function(newValue, oldValue) {});
* $scope.$watchGroup(['name', 'myOtherName'], function(newValue, oldValue) {});

# one time binding

```
<h1>{{::model.name}}</h1>
```
