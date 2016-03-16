# configuration

* all configuration files are located in 'config/autoload'
* dependencies defind in 'dependencie.[global|local].php' files
* routing defind in 'routes.[global|local].php' files

# middleware

* this is the place where the magic happens
* if your action is a class
    * must implement the '[MiddlewareInterface](https://github.com/zendframework/zend-stratigility/blob/master/src/MiddlewareInterface.php)' interface
    * it should provide dependency injection for the template renderer and the needed services (either constructor or method dependency injection)
```

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
