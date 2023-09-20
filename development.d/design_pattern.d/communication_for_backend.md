# Communication for backend development

## Request-Response-Pattern

* Client is requsting information to a server
* Server is fetching information by consuming resources
* Server is responsing to the client
* Benefit
  * Simple to implement
  * One solution fits many problem solving
  * Scalable
  * Reliabile
  * Ease of debugging
* Negativ
  * Latancy
  * Data inconsistency in case of failure
  * Not suitable for real time communication
  * Inefficient for broadcasting

## Publish-Subscribe-Pattern

* Publisher is producing data as message and send it to a broker
* Broker is distributing the message to all or some subsciber
* Subscriber is consuming the message and doing something
* Benefit
  * Asynchronous Communication
  * Loose coupling of components
  * High scalable
  * Independent of language and protocol
  * Load balancable
* Negativ
  * Complex in implementation
  * Message duplication
  * Scalability challanges if broker becomes overloaded
  * Complex error handling

## Short-Polling-Pattern

* Client is requesting new data from server
* Server either response with "no new data" or with some fresh data
* Benefit
  * Simple
  * Compatible
* Negativ
  * Latency
  * Inefficience
  * Scaling

## Long-Polling-Pattern

* Client is creating a long-lasting connection to the server
* Client informs the server to message the client once the server has a data once in a while
* Server is sending a message once there is something "to say"
* Benefit
  * Low latency
  * Real-time updates
* Negativ
  * Resource intensive
  * Increased latancy
  * Hard to scale

## Push-Pattern

* Client is creating a long-lasting connection to the server
* If either the client or the server have a message, they are using this bi-directional-connection
* Benefit
  * Reduced latency
  * Efficiency
* Negativ
  * Hard to scale
  * Client support

## Links

* [Communication Design Patterns for Backend Development](https://www.freecodecamp.org/news/communication-design-patterns-for-backend-development/) - 20230913
