# hexagonal architecture

* aka "Ports and Adapters"
* invented by "Alistair Cockburn"
* allows an application to be equally driven by users, programs, automated test or batch scripts
* can be developed and tested in isolation from its eventual run-time devices and databases
* the used framework or library is unimportant, writing clean code that keeps the maintenance cost low is important
* infrastructure is the detail that makes your business rules work
* try to make your functions do one and just one thing so it’s less probable having people messing around with it
* do not write fragile code
* legacy code is code without tests
* use mocks when crossing boundaries
* when there is a behavior not clearly owned by just one Entity in your domain, you should create a domain service

# edges of an hexagonal architecture

* persistence (decoupled by an interface)
* delivery mechanism (console, web, api)

# first approach

* create a user story
* devide and conquer (split into tasks)

# links

* http://www.objectmentor.com/resources/articles/srp.pdf
* http://php-di.org/
* http://dddinphp.org
