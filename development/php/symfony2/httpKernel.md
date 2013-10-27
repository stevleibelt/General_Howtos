# HttpKernel component

* transform a request into a response
* event driven (via (event) dispatcher and (controller) resolver

# KernelEvents

* REQUEST - perfect for security handling and routing for setting controller, action and arguments/parameters
* CONTROLLER - controller is created, dependencies are resolved, action is called
* VIEW - transform a non response value (returned by the controller) into a response object
* RESPONSE - modifies response object before sending it (injecting javascript before body tag, adding content)
* TERMINATE - doing heavy action after content is send to the user (logging, sending mails)
* EXCEPTION - handles thrown exception to return a proper response object and to deal with the exception


# Link

* [http kernel doc](http://symfony.com/doc/current/components/http_kernel/introduction.html)
* [kernel events](http://symfony.com/doc/current/components/http_kernel/introduction.html#http-kernel-creating-listener)
* [router listener](http://api.symfony.com/2.3/Symfony/Component/HttpKernel/EventListener/RouterListener.html)
* [controller resolver interface](http://api.symfony.com/2.3/Symfony/Component/HttpKernel/Controller/ControllerResolverInterface.html)
* [foss rest bundle](https://github.com/friendsofsymfony/FOSRestBundle)
* [terminable interface](http://api.symfony.com/2.3/Symfony/Component/HttpKernel/TerminableInterface.html)
