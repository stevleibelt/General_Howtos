# setting the base url

* use [setBaseUrl](https://github.com/mgonto/restangular#setbaseurl) in your restangular.js file

```
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-03-12
 */

'use strict';

(function (window, angular) {
    angular.module('bazzline.angularDevelopment')
        //some more configuration on your side
        //...
        .config(['RestangularProvider',
            function (RestangularProvider) {
                RestangularProvider.setBaseUrl('/api/my/base/url');
            }
        ]);
})(window, angular);

```

# supporting HAL rest endpoint

* add an [addResponseInterceptor](https://github.com/mgonto/restangular#addresponseinterceptor) in your restangular.js file

```
/**
 * Below is a general HAL handling in restangular. This example does not cover handling of "sometimes HAL endpoints".
 * 
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-03-12
 */

'use strict';

(function (window, angular) {
    angular.module('bazzline.angularDevelopment')
        //some more configuration on your side
        //...
        //add a response intereceptor (support for hal handling)
        .config(['RestangularProvider',
            function (RestangularProvider) {
                RestangularProvider.addResponseInterceptor(function (data, operation, what, url, response, deferred) {
                    var extractedData;

                    //remove logging after you have added all available operation handlings
                    console.log('restangular.js addResponseInterceptor operation: ' + operation);
                    console.log('restangular.js addResponseInterceptor data: ' + JSON.stringify(data));
                    if(operation === 'getList') {
                        extractedData = data._embedded.items;
                    } else {
                        extractedData = data;
                    }

                    return extractedData;
                });
            }
       ]);
})(window, angular);
```
