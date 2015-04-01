# disable interval if controller is not used (route has changed)

```javascript
'use strict';

(function (window, angular)
{
    function IntervalController($scope, $interval)
    {
        var interval;

        interval = $interval(function() {
            console.log('foo');
        });
        }, 20000);

        //stop interval when loosing scope
        $scope.$on('$destroy', function() {
            $interval.cancel(interval);
        });
    }

    angular.module('bazzline.Demo')
        .controller('IntervalController', ['$scope', '$interval', IntervalController]);
})(window, angular);
```

# links

* https://docs.angularjs.org/api/ng/filter/filter
* https://docs.angularjs.org/api/ng/service/$interval
