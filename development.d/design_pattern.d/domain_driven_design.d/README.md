# Domain Driven Design

DDD is a set of philosophically concepts to build software for complex domains.
Core questions are strategic patterns of integrating bounded contexts, covering tactical patterns for creating effective domain models and delves design patterns you can applay to utilize the domain model and build effective applications.

DDD tries to explain why the language, collaboration and context are the most important facts in DDD.

## Project structure

```bash
context
  # Bounded context
  domain_a
    adapters
      repositories
    # Contains code to interact with other domains, proxy
    anti_corruption_layer
    # Contains high level code, depends on ports
    # Coordinates interaction between presentation
    #  and domain layer
    api
      commands
        handlers
      queries
      tasks
      # Operations not belonging to a specifc entity
      #  or value object
      services
    # Contains high level code, depends on ports
    domain
      # Set of entities and value objects as cohesive unit
      aggregates
      enums
      events
      # Entities, models without unique id
      # Value Objects, models without unique id
      models
    # Contains low level code, implements ports
    # Or adapter/implementation
    # Implements technical details for external integration
    infrastructure
      # Contains things like get_session
      database_a
      # Contains things like get_connection
      ldap_a
      mail_a
      repositories
    interfaces
      console
      http
    # high level code: interface / contract - optional
    [ports]
      database_a
      ldap_a
      mail_a
      repositories
      
shared
  # Contains things like get_session
  database
  events
  exceptions
  logger
  event_or_message_bus
  models
  utilities
```

## Steps

* Distiling the problem domain
* Focusing on the core domain
* Model-driven design
* Domain model implementation patterns
* Maintaining the integrity of domain models with bounded context
* Context mapping
* Application architecture

## Database

## Notes

* Focus on solving the customers problem and not focus on using the latest technologies
* Think of the behaviour first when modeling your domain
* Do not think about the tools (database, etc.)

## Books and Links

* [Bounded context: martinfowler.com](http://martinfowler.com/bliki/BoundedContext.html) - 20150828
* [Clear your concepts: codeproject.com](http://www.codeproject.com/Articles/339725/Domain-Driven-Design-Clear-Your-Concepts-Before-Yo) - 20150828
* [Clean architecture with ddd layering in php: slideshare.net](www.slideshare.net/_leopro_/clean-architecture-with-ddd-layering-in-php-35793127) - 20151222
* [Ddd Example: mirkosertic.de](http://blog.mirkosertic.de/architecturedesign/dddexample) - 20150723
* [Ddd in PHP: github.com](https://gitub.com/dddinphp) - 20150715
* [Ddd: fincher.org](http://www.fincher.org/tips/General/SoftwareEngineering/DomainDrivenDesign.shtml) - 20150731
* [Ddd: wikipedia.org](https://en.wikipedia.org/wiki/Domain-driven_design) - 20150731
* [Designing software architecture with Domain-Driven Design: endpointdev.com](https://www.endpointdev.com/blog/2026/05/designing-software-architecture-ddd-part-3/) - 20260616
* [Difference entities and value objects: culttt.com](http://culttt.com/2014/04/30/difference-entities-value-objects/) - 20150723
* [Directory structure: github.com](https://gist.github.com/satooshi/6396551) - 20150731
* [Doman driven: opentaps.org architecture](http://www.opentaps.org/docs/index.php/Domain_Driven_Architecture) - 20150723
* [Getting Started with Domain-Driven Design in ASP.NET Core: telerik.com](https://www.telerik.com/blogs/getting-started-domain-driven-design-aspnet-core) - 20260616
* [How to keep a complex value object immutable: stackoverflow.com](http://stackoverflow.com/questions/7405278/ddd-how-to-keep-a-complex-value-object-immutable) - 20150723
* [State of union: github.com](https://github.com/PhpFriendsOfDdd/state-of-the-union) - 20150715
* [Strategic ddd with context mapping: infoq.com](http://www.infoq.com/articles/ddd-contextmapping) - 20150828
* [The ddd community: domaindrivendesign.org](http://www.domaindrivendesign.org/) - 20150731
