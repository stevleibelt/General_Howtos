# event

* is an occurence captured of something happened somewhere in the domain
* are immutable since they record something happend in the past
* constructor will initialize the full state of an event
* designed to communicate a bounded context

## notes

* adding a new component should not result in adapting an other component
* connect all components with in a single object
* should be represented as verbs
* should reflect that something happened in the past
    * implement method like "occuredOn() : \DateTime"
* always use a minimum amount of information to stick as close as possible to KISS
* can be stored in a database (serialized)
* can be spred by using a messaging queue

## examples

* OrderPlaced
* ProductAdded
* UserRegistered
* UserRelocated
