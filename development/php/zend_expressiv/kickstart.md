# what it is

* it 
    * is a microframework
    * implements PSR-7
    * is fully functional middleware stack
    * is the beginning of Zend Framework 3
* lightweight wrapper around other libraries
* supports
    * multiple routers
    * multiple service locators
    * multiple templating systems
    * controllers

## simple example

```php
<?php
use Zend\Expressive\AppFactory;

chdir(dirname(__DIR__));
require 'vendor/autoload.php'

$application = AppFactory::create();

$application->get(
    '/',
    function ($request, $response, $next) {
        $response->getBody()->write('Hello, world!');

        return $response;
    }
);

$application->pipeRoutingMiddleware();
$application->pipeDispatchMiddleware();

$application->run();
```

## controller example

```php
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

//you could even create a class with an invoke method

public function __invoke(
    ServerRequestInterface $request,
    ResponseInterface $response,
    callable $next = null
) {
    return new HtmlResponse($this->template->render('index::homepage'));
}
```

# middleware

* interacts with the request and manipulates the response
* can be used for things like
    * authentication
    * authorization
    * session
    * handling anything in the application level
* almost everything is middleware, even routes or controllers

## middleware class example

```php
class SessionMiddleware
{
    protected $sessionContainer;

    //...
    public function __invoke(
        ServerRequestInterface $request,
        ResponseInterface $response,
        callable $next = null
    ) {
        $request = $request->withAttribute('session', $this->sessionContainer->getSession());

        return (is_null($next)) ? $response : $next($request, $response);
    }
}
```

# links

* https://github.com/dragonmantank
* https://zend-expressive.readthedocs.org/en/latest
* https://github.com/zendframework/zend-expressive-skeleton
* https://github.com/dragonmantank/phparch-zend-expressive
* https://github.com/dragonmantank/zendexpressive-session-middleware
* http://ctankersley.com
