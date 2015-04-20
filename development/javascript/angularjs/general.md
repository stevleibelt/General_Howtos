# components

* controller
  * used to glue services, filters and directives together
  * defines a scope for available properties
* services
  * service
    * shared instance created with "new"
    * special case of a factory
  * factory
    * created a service by using the "factory" method
    * special case of a provider
  * provider
    * core angular service implementation
    * can be configured in the angular bootstrapping process
    * most powerfull service in angular
* filter
  * used to transforme input values into well defined output values
* directives
  * markers in html
  * includes templates and logic (view helper)

# links

* https://github.com/angularjs-de/dpunkt-buch-beispiele

# books

* AngularJS (dpunkt Verlag, ISBN 978-3-86490-154-6)
