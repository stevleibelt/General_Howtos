
# Debug Action call

* since zend framework 2 is using dependency injection, you can not debug in the constructor
* taken from http://stackoverflow.com/questions/12179840/how-to-get-controller-and-action-name-in-zf2 - 130429

```php
<?php
namespace MyModule\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Mvc\MvcEvent;
use Zend\Stdlib\RequestInterface;
use Zend\Stdlib\ResponseInterface;

/**
* Example controller for debugging.
*
* @author artodeto
* @since 2013-04-29
*/
class MyController extends AbstractActionController
{
    /**
    * This action is an example action when you know the action name.
    *
    * @author artodeto
    * @since 2013-04-29
    */
    public function myKnownAction ()
    {
        echo var_export(
            array(
                'controller' => $this->params('controller'),
                'action' => $this->params('action')
            ), 
            true
        );
    }

    /**
    * This action will be triggerd, when called action is not implemented yet.
    *
    * @author artodeto
    * @since 2013-04-29
    */
    public function notFoundAction()
    {
        parent::notFoundAction();

        return array(
                   'controller' => $this->params('controller'),
                   'action' => $this->params('action')
               );
    }
}
```
