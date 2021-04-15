# configuration

* all configuration files are located in 'config/autoload'
* dependencies defind in 'dependencie.[global|local].php' files
* routing defind in 'routes.[global|local].php' files

# middleware

* this is the place where the magic happens
* if your action is a class
    * must implement the '[MiddlewareInterface](https://github.com/zendframework/zend-stratigility/blob/master/src/MiddlewareInterface.php)' interface
    * it should provide dependency injection for the template renderer and the needed services (either constructor or method dependency injection)

# pipe if

* midleware should (potentially) run on every execute
    * logging reqeust
    * performing content negotiation
    * handling cookies
    * error handling
    * application segregation

* route if

* middleware is reacting to a given path
* you use dynamic routing
* restrict middleware to specifig HTTP methods
* generate uris to your middleware

# factory

* must implement the [ContainerInterface](https://github.com/container-interop/container-interop/blob/master/src/Interop/Container/ContainerInterface.php)

# answers

## how to render and output the html code?

* do it in the middleware

```php
$html = $this->templateRenderer->render('my_identifier');
$response->withHeader('Content-Type', 'text/html');
$response->getBody()->write($html);

return $response;
```

## can i use other middleware?

* yes
* take a look to some slime framework middleware like [CSRF Protection](https://github.com/slimphp/Slim-Csrf) or [HTTP Cache](https://github.com/slimphp/Slim-HttpCache)

# links

* [build nasa photo gallery example](http://www.sitepoint.com/build-nasa-photo-gallery-zend-expressive/)
* [cookbook](https://github.com/zendframework/zend-expressive/tree/master/doc/book/cookbook)
* [one factory for all](https://xtreamwayz.com/blog/2015-12-29-zend-expressive-action-factory-one-for-all)
* [one abstract factory for all](https://xtreamwayz.com/blog/2015-12-30-psr7-abstract-action-factory-one-for-all)
* [custom dispatch middleware, default route middleware and route attributes](https://github.com/zendframework/zend-expressive/issues/312#issuecomment-180304758)
